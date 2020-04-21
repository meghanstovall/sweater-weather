require "rails_helper"

RSpec.describe "Directions Service" do
  it "can connect to API and get direction info", :vcr do
    service = DirectionsService.get_road_trip("Denver,CO", "Pueblo,CO", ENV['DIRECTIONS_API_KEY'])

    expect(service.class).to eq(Hash)
    expect(service[:routes].class).to eq(Array)
  end
end
