require 'spec_helper'

describe WeatherBot::Commands::Weather do
  def app
    WeatherBot::Bot.instance
  end

  subject { app }

  xit 'returns summary of todays weather!' do
    VCR.use_cassette("weather/get_todays_weather") do
      expect(message: "#{SlackRubyBot.config.user} Weather now", channel: 'channel').to respond_with_slack_message('Mostly Cloudy')
    end
  end
end
