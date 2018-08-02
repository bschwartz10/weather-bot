require 'spec_helper'

describe DarkSkyService do

  describe "todays weather" do
    it "returns todays weather details" do
      # VCR.use_cassette("services/get_todays_weather") do
        weather = DarkSkyService.new.get_todays_weather(:new_york)

        expect(weather).to be_a(Hash)
        expect(weather).to have_key(:summary)
        expect(weather).to have_key(:icon)
        expect(weather).to have_key(:temperature)
      # end
    end
  end
end
