require 'rails_helper'
require 'json_helper'

RSpec.describe "Api::V1::Users", type: :request do

  describe "Create user" do
    it "should be valid" do
      post "/api/v1/users", params: { user: { username: "foobarbaz", password: "123456"} }

      expect(response).to have_http_status(:no_content)
    end

    it "fails to create a user with bad params" do
      post "/api/v1/users", params: { user: { password: "1234"} }

      expect(response).to have_http_status(:bad_request)
    end
  end

  describe "List users" do
    before(:all) do
      User.create(username: "foobar", password: "123456")
      User.create(username: "foobar1", password: "123456")
      User.create(username: "foobar2", password: "123456")
    end

    it "returns all users" do
      get "/api/v1/users"

      expect(response).to have_http_status(:ok)
      expect(json(response).size).to eq User.all.size
    end
  end

  describe "Show user" do
    before do
      @user_id = User.create(username: "foobar", password: "123456").id
    end

    it "returns user" do
      get "/api/v1/users/#{@user_id}"

      expect(response).to have_http_status(:ok)
      expect(json(response)["id"]).to eq @user_id
    end
  end

end
