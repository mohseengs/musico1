# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#adding category
categories = ["Accustic", "Sufi", "BGM", "Indipop", "Pop" ,"Kpop", "Rock",]
categories.each do |category|
    Category.create!(:name => category)
end

#adding languages
languages = ["Hindi", "English" , "Urdu", "Punjabi", "Marathi", "Malyalam", "Bhojpuri" ]
languages.each do |language|
    Language.create!(:name => language)
end


