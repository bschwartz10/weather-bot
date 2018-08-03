require 'faraday'

module WeatherBot
  module Commands
    class Weather < SlackRubyBot::Commands::Base
      command 'Weather now' do |client, data, _match|
        dss = DarkSkyService.new
        weather = dss.get_todays_weather(:new_york)
        icon = dss.get_icon(weather[:icon])
        client.web_client.chat_postMessage(
          channel: data.channel,
          as_user: true,
          text: "The weather in New York is currently #{weather[:summary]} with a temperature of #{weather[:temperature]}˚F #{icon}."
        )
      end
      command 'Weather tomorrow' do |client, data, _match|
        dss = DarkSkyService.new
        weather = dss.get_tomorrows_weather(:new_york)
        puts weather.inspect
        icon = dss.get_icon(weather[:icon])
        client.web_client.chat_postMessage(
          channel: data.channel,
          as_user: true,
          text: "Tomorrows forecaset for New York is #{weather[:summary]} The temperature will range from a low of #{weather[:temperatureLow]}˚F and a high of #{weather[:temperatureHigh]}˚F #{icon}."
        )
      end
    end
  end
end
