require "rails_helper"

RSpec.describe "Google Geocoding and Open Weather API's" do
  it "can get lat and long for a city" do
    get "/api/v1/forecast?location=denver,co"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json.has_key?(:data)).to eq(true)
    expect(json[:data][:attributes][:latitude]).to eq(39.7392358)
    expect(json[:data][:attributes][:longitude]).to eq(-104.990251)
    expect(json[:data][:attributes][:location]).to eq("Denver, CO, USA")
  end
end
