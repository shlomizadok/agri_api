class V1::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user_from_token!

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        sign_up(resource_name, resource)
        render json: resource
      else
        expire_data_after_sign_in!
        render json: resource
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      render json: resource
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end