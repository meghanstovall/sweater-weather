require "rails_helper"

RSpec.describe "Unsplash API" do
  it "can get a background image from API" do
    get "/api/v1/backgrounds?location=denver,co"

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json).to have_key(:attributes)
    expect(json[:attributes]).to have_key(:url)
  end
end
