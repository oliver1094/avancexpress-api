class Api::V1::AuthorizationController < ApplicationController

  before_action :doorkeeper_authorize!, :except => [:login]
  def index
    render :json => {user: 1}
  end

  def login
    user = User.authenticate(params[:email], params[:password])
    if user
      app_production = Doorkeeper::Application.find(OauthApplication::WEB_APP)
      access_token = Doorkeeper::AccessToken.create!(application_id: app_production.id,
                                                                resource_owner_id: user.id,
                                                                scopes: app_production.scopes, use_refresh_token: false,
                                                                expires_in: nil)

      render :json => {user: {id: user.id, email: user.email,
                              type_user: {
                                  id: user.type_user.id,
                                  name: user.type_user.name
                              }
                              },
                       access_token: access_token.token}, status: :accepted
    else
      render json: {error:'Usuario No Encontrado'}
    end
  end

  def logout
    access_token = Doorkeeper::AccessToken.find_by_token(params[:access_token])
    if access_token
      access_token.destroy
      render json: {response: 'success'}
    else
      render json: {response: 'invalid token'}
    end

  end

end
