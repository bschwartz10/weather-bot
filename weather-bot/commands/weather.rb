require 'faraday'

module WeatherBot
  module Commands
    class Weather < SlackRubyBot::Commands::Base
      command 'Weather now' do |client, data, _match|
        weather = DarkSkyService.new.get_todays_weather(:new_york)
        client.web_client.chat_postMessage(
          channel: data.channel,
          as_user: true,
          text: weather[:summary]
        )
      end
    end
  end
end
