require 'rails_helper'
require 'json_helper'

RSpec.describe "Api::V1::Pets", type: :request do
  

  describe "List pets" do
    before(:all) do
      @user_id = User.create(username: "fobarfj", password: "!23434434").id
      @user_id_1 = User.create(username: "fdfdfd", password: "!23434434").id
      Pet.create(name: "foobar", kind: "dog", age_in_years: 1, user_id: @user_id)
      Pet.create(name: "foobar1", kind: "cat", age_in_years: 1, user_id: @user_id)
      Pet.create(name: "foobar2", kind: "fish", age_in_years: 1, user_id: @user_id_1)
    end

    it "returns all pets of user" do
      get "/api/v1/users/#{@user_id}/pets"

      expect(response).to have_http_status(:ok)
      expect(json(response).size).to eq 2
    end
  end

  describe "Show pet" do
    before do
      @user_id = User.create(username: "fobarfj", password: "!23434434").id
      @pet_id = Pet.create(name: "foobar", kind: "dog", age_in_years: 1, user_id: @user_id).id
    end

    it "returns pet" do
      get "/api/v1/users/#{@user_id}/pets/#{@pet_id}"

      expect(response).to have_http_status(:ok)
      expect(json(response)["id"]).to eq @pet_id
    end
  end

end
