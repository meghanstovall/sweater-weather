require "rails_helper"

RSpec.describe "User Registration" do
  it "can send json with user email, password, and password confirmation" do
    user = {email: "meghan.stovall@gmail.com", password: "pass1", password_confirmation: "pass1"}

    post "/api/v1/users", params: user

    new_user = User.last

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json).to have_key(:attributes)
    expect(json[:attributes]).to have_key(:email)
    expect(json[:attributes]).to have_key(:api_token)
  end

  it "throuws 400 level error if credentials were bad" do
    user = User.create!(email: "meghan.stovall@gmail.com", password: "pass1")
    user2 = {email: "email@gmail.com", password: user.password, password_confirmation: user.password_confirmation}

    post "/api/v1/users", params: user2

    new_user = User.last

    json = JSON.parse(response.body, symbolize_names: true)[:data]
require "pry"; binding.pry
    expect(json[:attributes][:status]).to eq(406)
    expect(json[:attributes][:message]).to eq("Not Acceptable")
    expect(json[:attributes][:errors]).to eq("Password digest can't be blank and Password can't be blank")
  end
end
