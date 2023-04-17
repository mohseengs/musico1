require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    before(:all) do
      @user = create(:user)
    end
    it "valid with all attributes" do 
      user = build(:user)
      expect(user).to be_valid  
    end
    it "name should not be blank" do 
      user = build(:user, name:nil)
      expect(user).to_not be_valid  
    end
    it "profile picture can be blank" do 
      user = build(:user, profile_picture:nil)
      expect(user).to be_valid  
    end
    it "password should not be blank" do 
      user = build(:user, password_digest:nil)
      expect(user).to_not be_valid  
    end
  end



  describe "attributes" do
    it { should respond_to(:name) }
    it { should respond_to(:email) }
    it { should respond_to(:dob) } 
    it { should respond_to(:password_digest) } 
    it { should respond_to(:profile_picture) } 
  end


  describe "associations" do
    it { should have_and_belong_to_many(:songs) }
    it { should have_many(:playlists) }
    it { should have_many(:notifications) }
    it { should have_and_belong_to_many(:recieved_notifications) }
    it { should have_many(:likes) }
    it { should have_many(:followers) }
    it { should have_many(:followings) }
    it { should have_one(:history) }
    it { should have_one(:song_queue) }
  end

end
