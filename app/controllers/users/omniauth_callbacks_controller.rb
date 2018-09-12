class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # def facebook
  #   # You need to implement the method below in your model (e.g. app/models/user.rb)
  #   @user = User.from_omniauth(request.env["omniauth.auth"])

  #   if @user.persisted?
  #     sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
  #     set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
  #   else
  #     session["devise.facebook_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end

  def failure
    redirect_to root_path
  end

  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted? && user.valid?
      sign_in user
      flash.notice = "Signed in with #{request.env["omniauth.auth"].provider}!"
      redirect_to after_sign_in_path_for(user)
    elsif user.errors.include?(:email)
      flash.alert = "Email address associated with your #{request.env["omniauth.auth"].provider} account had already been registered in the system"
      redirect_to root_path
    else
      flash.alert = "Errror occured while signing in with #{request.env["omniauth.auth"].provider}. Please try again"
      redirect_to root_path
    end
  end

  alias_method :facebook, :all
  alias_method :google_oauth2, :all
end
