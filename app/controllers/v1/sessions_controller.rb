class V1::SessionsController < ApplicationController
  skip_before_action :authenticate_user_from_token!

  # POST /v1/login
  def create
    @user = User.find_for_database_authentication(email: params[:email])
    return invalid_login_attempt unless @user

    if @user.valid_password?(params[:password])
      sign_in :user, @user, store: false
      render json: @user, serializer: V1::SessionSerializer, root: nil
    else
      invalid_login_attempt
    end
  end

  def facebook
    puts params[:user][:auth_token]
    token = params[:user][:auth_token]
    @user = User.from_facebook(get_facebook_user(token))
    return head 401 unless @user
    sign_in :user, @user, store: false
    render json: @user, serializer: V1::SessionSerializer, root: nil
  end

  private

  def invalid_login_attempt
    warden.custom_failure!
    render json: {error: t('sessions_controller.invalid_login_attempt')}, status: :unprocessable_entity
  end

  def get_facebook_user(token)
    uri = URI('https://graph.facebook.com/me')
    p = { fields: 'id,name,email', access_token: token }
    uri.query = URI.encode_www_form(p)
    if res = Net::HTTP.get_response(uri)
      res.value
      return JSON.parse(res.body)
    else
      head 401
    end
  end
end