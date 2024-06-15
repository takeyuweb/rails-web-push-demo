class Post < ApplicationRecord
  def notify!
    api_instance = OneSignal::DefaultApi.new
    notification = OneSignal::Notification.new(
      app_id: Rails.application.credentials.dig(:onesignal, :app_id),
      included_segments: ["Total Subscriptions"],
      # https://documentation.onesignal.com/reference/push-channel-properties
      # https://github.com/OneSignal/onesignal-ruby-api/blob/master/docs//Notification.md
      contents: {
        en: body,
        es: body,
      },
      is_any_web: true, # 指定がないとどこにも届かない #<OneSignal::InlineResponse200:0x00007f86b02e6e70 @id="", @errors=["All included players are not subscribed"]>
    )

    Rails.logger.info api_instance.create_notification(notification).inspect
  end
end
