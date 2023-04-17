require 'rails_helper'
RSpec.describe FollowsController, type: :controller do
  
    describe "GET /index" do
      let(:user) {create(:user)}  
    
      it "should redirect to login if not logged in" do
        session[:user_id] = user.id
        get :index
        expect(response).not_to redirect_to(login_path)
      end

      it "should redirect to" do
        get :index
        expect(response).to redirect_to(login_path)
      end

      it "should create follow" do
        session[:user_id] = user.id
        other_user = create(:user)
        post :create , params: {following_id: other_user.id} , :format => :js
        expect(response).to have_http_status(:success)
      end

      it "should destroy follow" do
        session[:user_id] = user.id
        other_user = create(:user)
        post :destroy , params: {following_id: other_user.id} , :format => :js
        expect(response).to have_http_status(:success)
      end

  end
end
