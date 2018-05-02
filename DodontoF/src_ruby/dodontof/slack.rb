require 'net/http'
require 'uri'
require 'json'

module DodontoF
  module Slack

    def sendSlackMessage(msg)
      slack_webhook_url = ENV["SLACK_WEBHOOK_URL"]
      return nil if( slack_webhook_url.empty? )

      uri = URI.parse(slack_webhook_url)
      params = {
        text: msg,
        channel: "#nt-d6666",
        username: "d6666-bot",
        icon_emoji: ':six:'
      }
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.start do
        request = Net::HTTP::Post.new(uri.path)
        request.set_form_data(payload: params.to_json)
        http.request(request)
      end
    end
    module_function :sendSlackMessage

  end
end