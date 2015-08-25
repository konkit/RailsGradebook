require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  render_views
  let(:json) { JSON.parse(response.body) }

  describe "GET #index" do
    it "returns 200 OK" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #get_current_user" do
    let!(:user) { FactoryGirl.create(:student) }

    before(:each) do
      expect(controller).to receive(:current_user).and_return( user )
      get :get_current_user, {format: :json}
    end

    it "returns proper json when user is signed in" do
      expect(response.body).to be_json_eql(user.to_json(:only => [:id, :name, :email, :role]))
    end

    it "has proper response code " do
      expect(response).to have_http_status(:ok)
    end
  end
end
