require 'spec_helper'

describe DarkSkyService do

  describe "todays weather" do
    it "returns todays weather details" do
      VCR.use_cassette("services/get_todays_weather") do
        weather = DarkSkyService.new.get_todays_weather(:new_york)

        expect(weather).to be_a(Hash)
        expect(weather).to have_key(:summary)
        expect(weather).to have_key(:icon)
        expect(weather).to have_key(:temperature)
      end
    end
  end

  describe "weather icon" do
    it "returns the corresponding emoji for given weather icon" do
      dss = DarkSkyService.new
      weather = { :icon => "rain" }

      expect(dss.get_icon(weather[:icon])).to eq(':rain_cloud:')
    end
  end

  describe "tomorrows weather" do
    it "returns tomorrows weather details" do
      VCR.use_cassette("services/get_tomorrows_weather", :record => :new_episodes) do
        weather = DarkSkyService.new.get_tomorrows_weather(:new_york)

        expect(weather).to be_a(Hash)
        expect(weather).to have_key(:summary)
        expect(weather).to have_key(:icon)
        expect(weather).to have_key(:temperatureLow)
        expect(weather).to have_key(:temperatureHigh)
      end
    end
  end

  describe "weekly forecast" do
    it "returns daily summary for each day of week" do
      VCR.use_cassette("services/get_weekly_forecast") do
        weather = DarkSkyService.new.get_weekly_forecast(:new_york)
        daily_forecast = weather[:data][0]

        expect(weather).to be_a(Hash)
        expect(weather[:data]).to be_an(Array)
        expect(daily_forecast).to have_key(:summary)
        expect(daily_forecast).to have_key(:icon)
      end
    end
  end
end
