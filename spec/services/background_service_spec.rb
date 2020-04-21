require "rails_helper"

RSpec.describe "Background Image Service" do
  it "can connect to API and get image url", :vcr do
    service = BackgroundService.get_img_url("Denver")

    expect(service.class).to eq(Hash)
    expect(service[:results].class).to eq(Array)
  end
end
