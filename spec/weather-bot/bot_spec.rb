require 'spec_helper'

describe WeatherBot::Bot do
  def app
    WeatherBot::Bot.instance
  end

  subject { app }

  it_behaves_like 'a slack ruby bot'
end
