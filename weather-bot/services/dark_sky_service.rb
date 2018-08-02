require 'faraday'

class DarkSkyService

  def initialize
    @conn = Faraday.new(:url => 'https://api.darksky.net')
  end

  # Helper method to return JSON objects based on url and params
  def get_url(url, params=nil)
    response = @conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def locations
    {
      new_york: {
        latitude: '40.7831',
        longitude: '73.9712'
      }
    }
  end

  def get_todays_weather(city)
    get_url("/forecast/#{ENV['DARK_SKY_API_TOKEN']}/#{locations[city][:longitude]},#{locations[city][:latitude]}")[:currently]
  end


end
