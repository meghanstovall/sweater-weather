require "rails_helper"

RSpec.describe "Road Trip endpoint" do
  before :each do
    @user = User.create!(email: "meghan.stovall@gmail.com", password: "password1", api_key: ENV['DIRECTIONS_API_KEY'])
  end

  it "can get origin, destination, travel time, and forecast", :vcr do
    params = {origin: "Denver,CO", destination: "Pueblo,CO", api_key: @user.api_key}

    post "/api/v1/road_trip", params: params

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json[:attributes][:origin]).to eq("Denver,CO")
    expect(json[:attributes][:destination]).to eq("Pueblo,CO")
    expect(json[:attributes][:travel_time]).to eq("1 hour 48 mins")
    expect(json[:attributes].has_key?(:arrival_forecast)).to eq(true)
    expect(json[:attributes][:arrival_forecast].has_key?(:temp)).to eq(true)
    expect(json[:attributes][:arrival_forecast].has_key?(:description)).to eq(true)
  end

  it "will get 401 error with api key is invalid", :vcr do
    params = {origin: "Denver,CO", destination: "Pueblo,CO", api_key: ""}

    post "/api/v1/road_trip", params: params

    json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json[:attributes][:status]).to eq(401)
    expect(json[:attributes][:message]).to eq("Unauthorized")
  end
end
