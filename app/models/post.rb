class Post < ApplicationRecord
  def notify!
    api_instance = OneSignal::DefaultApi.new
    notification = OneSignal::Notification.new(
      app_id: Rails.application.credentials.dig(:onesignal, :app_id),
      included_segments: ["Total Subscriptions", "Inactive Subscriptions", "Active Subscriptions"],
      # https://documentation.onesignal.com/reference/push-channel-properties
      contents: {
        en: body,
      },
      template_id: Rails.application.credentials.dig(:onesignal, :template_id),
    )

    Rails.logger.info api_instance.create_notification(notification).inspect
  end
end
