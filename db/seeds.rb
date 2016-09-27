# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  { :name => 'Kuala Lumpur', :country_id => 1 },
  { :name => 'Labuan', :country_id => 1 },
  { :name => 'Putrajaya', :country_id => 1 },
  { :name => 'Johor', :country_id => 1 },
  { :name => 'Kedah', :country_id => 1 },
  { :name => 'Kelantan', :country_id => 1 },
  { :name => 'Malacca', :country_id => 1 },
  { :name => 'Negeri Sembilan', :country_id => 1 },
  { :name => 'Pahang', :country_id => 1 },
  { :name => 'Perak', :country_id => 1 },
  { :name => 'Perlis', :country_id => 1 },
  { :name => 'Penang', :country_id => 1 },
  { :name => 'Sabah', :country_id => 1 },
  { :name => 'Sarawak', :country_id => 1 },
  { :name => 'Selangor	', :country_id => 1 },
  { :name => 'Terengganu', :country_id => 1 }
].each do |c|
  State.find_or_create_by(:name => c[:name], :country_id => c[:country_id])
end
