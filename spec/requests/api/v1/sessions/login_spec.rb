require "rails_helper"

RSpec.describe "User login" do
  before :each do
    @user = User.create!(email: "meghan.stovall@gmail.com", password: "password1")
  end

  it "returns user's api key after logging in" do
    params = {email: @user.email, password: @user.password}

    post "/api/v1/sessions", params: params

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json).to have_key(:attributes)
    expect(json[:attributes][:email]).to eq("meghan.stovall@gmail.com")
    expect(json[:attributes][:api_key].class).to eq(String)
  end

  it "returns 400 level error when credentials are bad" do
    params = {email: @user.email, password: "pass1"}

    post "/api/v1/sessions", params: params

    json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json[:attributes][:status]).to eq(401)
    expect(json[:attributes][:message]).to eq("Unauthorized")
    expect(json[:attributes][:errors]).to eq("Bad Credentials")
  end
end
