require "rails_helper"

RSpec.describe "Antipode's" do
  it "can find the antipode to a given location" do
    location = "Hong Kong"
    get "/api/v1/antipode?location=#{location}"

    json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json[:attributes][:search_location]).to eq("Hong Kong")
    expect(json[:attributes].has_key?(:location_name))
    expect(json[:attributes][:forecast].has_key?(:summary))
    expect(json[:attributes][:forecast].has_key?(:current_temp))
  end
end
