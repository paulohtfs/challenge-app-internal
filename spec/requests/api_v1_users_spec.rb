require 'rails_helper'

RSpec.describe "ApiV1Users", type: :request do
  let(:user) { create(:admin) }
  let!(:users) do
    create_list(:admin, 1)
    create_list(:member, 1)
  end

  before { sign_in user }

  describe "GET /api/v1/users" do
    let(:expect_order_by_name) do
      User.all.map do |user|
        user.attributes.slice(*%w(id name email role))
      end
    end
    it "search for users" do
      get api_v1_users_path
      expect(response).to have_http_status(200)
    end

    it "return order by name" do
      get api_v1_users_path, params: { order_name: :desc }

      expect(JSON.parse(response.body)).to eq(expect_order_by_name)
    end
  end
end
