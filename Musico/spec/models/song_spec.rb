require 'rails_helper'

RSpec.describe Song, type: :model do
  let(:user) {create(:user)}
  let(:song) {build(:song)}
  let(:audio_file) {File.new(Rails.root.join('spec', 'fixtures', 'test.mp3'))}
  let(:thumbnail) {File.new(Rails.root.join('spec', 'fixtures', 'bg.jpg'))}
  describe "validations" do
    it "valid with all attributes" do 
      song = build(:song)
      song.audio.attach(io: audio_file, filename: 'test.mp3' , content_type: 'audio/mp3')
      song.thumbnail.attach(io: thumbnail, filename: 'bg.jpg' , content_type: 'image/jpg')
      expect(song).to be_valid  
    end
    it "name should not be blank" do 
      song = build(:song, name:nil)
      expect(song).to_not be_valid  
    end
    it "audio should not be blank" do 
      song = build(:song, audio:nil)
      expect(song).to_not be_valid  
    end
    it "category should not be blank" do 
      song = build(:song, category:nil)
      expect(song).to_not be_valid  
    end
    it "language should not be blank" do 
      song = build(:song, language:nil)
      expect(song).to_not be_valid  
    end
  end

  describe "attachments" do
    it "has an attached audio file" do
      song.audio.attach(io: audio_file, filename: 'test.mp3' , content_type: 'audio/mp3')
      expect(song.audio).to be_attached
    end

    it "has an attached audio file" do
      song.thumbnail.attach(io: thumbnail, filename: 'bg.jpg' , content_type: 'image/jpg')
      expect(song.thumbnail).to be_attached
    end
  end

  describe "associations" do
    it { should have_and_belong_to_many(:users) }
    it { should have_and_belong_to_many(:playlists) }
    it { should have_and_belong_to_many(:song_queues) }
    it { should have_and_belong_to_many(:histories) }
    it { should have_many(:likes) }
    it { should belong_to(:language) }
    it { should belong_to(:category) }
  end
  
end
