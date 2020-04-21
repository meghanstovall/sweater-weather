require "rails_helper"

RSpec.describe "Weather Service" do
  it "can connect to API and get forecast", :vcr do
    service = WeatherService.get_forecast(39.7392358, -104.990251)

    expect(service.class).to eq(Hash)
    expect(service.has_key?(:current)).to eq(true)
    expect(service[:current].class).to eq(Hash)
    expect(service.has_key?(:hourly)).to eq(true)
    expect(service[:hourly].class).to eq(Array)
    expect(service.has_key?(:daily)).to eq(true)
    expect(service[:daily].class).to eq(Array)
  end
end
