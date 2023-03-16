# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create(:name => "BGM")
Category.create(:name => "Indipop")
Category.create(:name => "Rap")
Category.create(:name => "Love")
Category.create(:name => "Sad")
Category.create(:name => "Rock")
Category.create(:name => "Accustic")
Category.create(:name => "Other")


Language.create(:name => "Hindi")
Language.create(:name => "English")
Language.create(:name => "Punjabi")

User.create(:name => "Mohseen",:email => "mohseentech@gmail.com",:password => "12345",:dob => "12-03-2000")
User.create(:name => "sumit",:email => "sumit@gmail.com",:password => "12345",:dob => "12-03-2000")


