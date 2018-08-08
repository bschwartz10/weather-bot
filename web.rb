require 'sinatra/base'

module WeatherBot
  class Web < Sinatra::Base
    get '/' do
      'Slack Bot working...'
    end
  end
end
