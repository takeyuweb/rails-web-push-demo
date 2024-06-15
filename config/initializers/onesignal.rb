require 'onesignal'

# setup authorization
OneSignal.configure do |config|
  # Configure Bearer authorization: app_key
  config.user_key = Rails.application.credentials.dig(:onesignal, :user_auth_key)
  config.app_key = Rails.application.credentials.dig(:onesignal, :rest_api_key)
end
