class Api::V1::ClientsController < ApplicationController

  before_action :doorkeeper_authorize!, :except => [:preregister, :get_client, :register, :upload_files]

  def index
    @clients = Client.all
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
      @client.motive = @dataClient[:motive]
      @client.client_key = SecureRandom.hex 32
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

    @email = params[:client_email]
    @files = params[:files]
    @user = User.find_by_email(@email)
    @client = @user.client


    @files.each do |file|
      # attach loaded data to the person object in controller
      client_files = FileClient.new
      client_files.name = file
      client_files.client_id = @client.id
      client_files.save
    end

    render json: {client: @client}
    end

end
