require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  
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
      it "@users should not contains current user" do
        session[:user_id] = user.id
        get :index
        expect(assigns(:users)).not_to eq([user])
      end
      it "should show user with id" do
        session[:user_id] = user.id
        get :show , params: {id: user.id}
        expect(assigns(:user)).to eq(user)
      end
  end

    describe "edit" do
      let(:user) {create(:user)}  
      it "should show allow to edit user" do
        session[:user_id] = user.id
        get :edit , params: {id: user.id}
        expect(response).to have_http_status(:success)
      end
      it "should not allow to edit user" do
        session[:user_id] = user.id
        user1 = create(:user)
        get :edit , params: {id: user1.id}
        expect(response).to have_http_status(400)
      end
      it "should update user" do
        session[:user_id] = user.id
        put :update , params: {id: user.id , user: { name: "mohseen" , email: "mohseentech@gmail.com" , password: "mohseentech" , dob: "04-10-2000"}}
        expect(response).to redirect_to(user_path(user.id))
      end
    end

    describe "destroy" do
      let(:user) {create(:user)}  
      it "should delete user" do
        session[:user_id] = user.id
        delete :destroy , params: {id: user.id}
        expect(response).to redirect_to(login_path)
      end
    end
end
