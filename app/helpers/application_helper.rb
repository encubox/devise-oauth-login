module ApplicationHelper
  # This helper is used in devise views but is absent in new versions of omniauth gems
  def omniauth_authorize_path(resource_name, provider)
    if provider.to_sym == :facebook
      user_facebook_omniauth_authorize_path
    elsif provider.to_sym == :google_oauth2
      user_google_oauth2_omniauth_authorize_path
    else
      raise 'Wrong parameters.'
    end
  end
end
