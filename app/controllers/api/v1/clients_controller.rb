class Api::V1::ClientsController < ApplicationController

  before_action :doorkeeper_authorize!, :except => [:preregister, :get_client, :register]

  def index
    @clients = Client.where(status: 'pending').order(created_at: :desc)
    render :index
  end

  def preregister
    @dataPrestamo = params[:dataPrestamo]
    @dataClient = params[:dataClient]
    @user = User.new
    @user.email = @dataClient[:email]
    @user.password = @dataClient[:passwords][:password]
    @user.password_confirmation = @dataClient[:passwords][:password]
    @user.is_active = false
    @user.type_user_id = TypeUser::CLIENT
    if @user.save
      @client = Client.new
      @client.name = @dataClient[:name]
      @client.last_name = @dataClient[:last_name]
      @client.phone = @dataClient[:phone]
      @client.telfijo = @dataClient[:telfijo]
      @client.monto = @dataClient[:monto]
      @client.motive = @dataClient[:motive]
      @client.client_key = SecureRandom.hex 32
      @client.status = 'pending'
      @client.user_id = @user.id
      if @client.save
        params = @dataPrestamo
        params.permit!
        @clientLoanDetail = ClientLoanDetail.new(params)
        @clientLoanDetail.client_id = @client.id
        if @clientLoanDetail.save
          UserMailer.welcome_email(@user, @client).deliver_later
          render json: {client_key: @client.client_key, status: 'success'}
        else
          @clientLoanDetail.destroy
          @client.destroy
          @user.destroy
          render json: {status: false, errors: @clientLoanDetail.errors}
        end
      else
        @client.destroy
        @user.destroy
        render json: {status: false, errors: @client.errors}
      end
    else
      @user.destroy
      render json: {status: false, errors: @user.errors}
    end
  end

  def register
    @client_key = params[:client_key]
    @data = params[:data]
    @client = Client.find_by_client_key(@client_key)
    @user = @client.user
    @address_client = AddressClient.new
    @client.last_name = @data[:last_name]
    @client.name = @data[:name]
    @client.name_two = @data[:name_two]
    @client.last_name_two = @data[:last_name_two]
    @client.birth_date = @data[:birth_date]
    @client.phone = @data[:phone]
    @client.rfc = @data[:rfc]
    @client.curp = @data[:curp]
    @client.client_key = nil
    if @client.save
      @address_client.street_number = @data[:street_number]
      @address_client.cp = @data[:cp]
      @address_client.state = @data[:state]
      @address_client.city = @data[:city]
      @address_client.municipio = @data[:municipio]
      @address_client.colonia = @data[:colonia]
      @address_client.client_id = @client.id
      if @address_client.save
        @user.is_active = true
        if @user.save
          render json: {message: 'success'}
        else
          render json: {message: @user.errors}
        end
      else
        render json: {message: @address_client.errors}
      end
    else
      render json: {message: @client.errors}
    end

  end

  def get_client
    @client_key = params[:client_key]
    @client = Client.find_by_client_key(@client_key)
    if @client
      render json: {client: @client, email: @client.user.email}
    else
      render json: {message: 'Error'}
    end

  end

  def upload_files

    @file = params[:file]
    @client = Client.find(params[:client_id])
    @file_client = FileClient.new
    @file_client.client_id = @client.id
    @file_client.name = @file

    if @file_client.save
      if !@file_client.name.file.nil?
        render json: {file: @file_client.name}
      else
        render json: {message: 'Error al subir el archivo'}
      end

    end

  end

  def get_client_files
    client_id = params[:client_id]
    client = Client.find(client_id)
    files = client.file_clients
    @file_array ||= []
    files.each do |file|
      @file_array.push({
                           name: file.name_identifier,
                           url: file.name.url
                       })
    end
    render json: {files: @file_array}
  end

  def get_clients
    clients = Client.all
    client_array ||= []
    clients.each do |client|
      client_array.push({
                            client: client,
                            client_loan_details: client.client_loan_details,
                            client_address: client.address_client
                        })
    end
    render json: {clients: client_array}
  end

  def change_status_loan
    status = params[:status]
    client_id = params[:client_id]
    client = Client.find(client_id)
    if status
      client.status = 'accepted'
    else
      client.status = 'rejected'
    end

    if client.save
      render json: {
          message: success
      }
    end
  end

end
