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
        latitude: '40.7589',
        longitude: '-73.9851'
      }
    }
  end

  def get_todays_weather(city)
    get_url("/forecast/#{ENV['DARK_SKY_API_TOKEN']}/#{locations[city][:latitude]},#{locations[city][:longitude]}")[:currently]
  end

  def get_tomorrows_weather(city)
    get_url("/forecast/#{ENV['DARK_SKY_API_TOKEN']}/#{locations[city][:latitude]},#{locations[city][:longitude]},#{format_date(24.hours.from_now.utc)}")[:daily][:data][0]
  end

  def format_date(date)
    date.to_time.to_i
  end

  def get_icon(icon)
    icons = {
      'clear-day' => ':sunny:',
      'clear-night' => ':crescent_moon:',
      'partly-cloudy-day' => ':partly_sunny:',
      'partly-cloudy-night' => ':partly_sunny:',
      'cloudy' => ':cloud:',
      'rain' => ':rain_cloud:',
      'sleet' => ':snow_cloud:',
      'snow' => ':snowflake:',
      'wind' => ':wind_blowing_face:',
      'fog' => ':fog:'
    }
    icons[icon]
  end

end
