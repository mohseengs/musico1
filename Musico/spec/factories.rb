FactoryBot.define  do

    factory :song do
      name {Faker::Name.name}
      language { Language.create(name: 'English')}
      category { Category.create(name: 'BGM')}
      users { create_list(:user, 2) }
      after :buld do |song|
        song.audio.attach(io: audio_file, filename: 'test.mp3' , content_type: 'audio/mp3')
        song.thumbnail.attach(io: thumbnail, filename: 'bg.jpg' , content_type: 'image/jpg')
      end
    end

    factory :user do
      name {Faker::Name.name}
      email {Faker::Internet.email}
      password_digest {Faker::Name.name}
      dob {Faker::Date.between(from: 2.days.ago, to: Date.today)}
    end
  end