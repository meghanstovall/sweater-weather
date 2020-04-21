require "rails_helper"

RSpec.describe "Google Service" do
  it "can connect to API and coordinates of a location", :vcr do
    service = GoogleService.get_coordinates("Denver,CO")

    expect(service.class).to eq(Hash)
    expect(service[:results][0][:formatted_address]).to eq("Denver, CO, USA")
    expect(service[:results][0][:geometry][:location][:lat]).to eq(39.7392358)
    expect(service[:results][0][:geometry][:location][:lng]).to eq(-104.990251)
  end
end
