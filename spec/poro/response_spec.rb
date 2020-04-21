require 'rails_helper'

RSpec.describe Response do
  it "exists with attributes" do
    res = ActionDispatch::Response.new
    res.status = :unauthorized
    response = Response.new(res)

    expect(response).to be_a Response
    expect(response.status).to eq(401)
    expect(response.message).to eq("Unauthorized")
    expect(response.errors).to eq(nil)
  end
end
