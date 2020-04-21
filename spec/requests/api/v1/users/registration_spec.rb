require "rails_helper"

RSpec.describe "User Registration" do
  before :each do
    @user = User.create!(email: "meghan.stovall@gmail.com", password: "password1", api_key: ENV['DIRECTIONS_API_KEY'])
  end

  it "can send json with user email, password, and password confirmation", :vcr do
    user = {email: "meghan@gmail.com", password: "pass1", password_confirmation: "pass1"}

    post "/api/v1/users", params: user

    new_user = User.last

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json).to have_key(:attributes)
    expect(json[:attributes][:email]).to eq("meghan@gmail.com")
    expect(json[:attributes][:api_key].class).to eq(String)
  end

  it "throuws 400 level error if email is already in use", :vcr do
    user = {email: @user.email, password: "pass2", password_confirmation: "pass2"}

    post "/api/v1/users", params: user

    new_user = User.last

    json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json[:attributes][:status]).to eq(406)
    expect(json[:attributes][:message]).to eq("Not Acceptable")
    expect(json[:attributes][:errors]).to eq("Email has already been taken")
  end

  it "throuws 400 level error if passwords dont match", :vcr do
    user = {email: "email@gmail.com", password: "pass1", password_confirmation: "pass2"}

    post "/api/v1/users", params: user

    new_user = User.last

    json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json[:attributes][:status]).to eq(406)
    expect(json[:attributes][:message]).to eq("Not Acceptable")
    expect(json[:attributes][:errors]).to eq("Password confirmation doesn't match Password")
  end
end
