# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {name: 'Jin Park', email: 'jin@jin.jin', password: 'password1'},
  {name: 'Anthony Mangano', email: 'Anthony@anthony.anthony', password: 'password1234'}
])

contacts = Contact.create([
  {:address => '777 Broadway',
    :email => 'app@appacademy.io',
    :name => 'George',
    :phone_number => '123-123-1234',
    :user_id => 1},
  {:address => '555 Broadway',
    :email => 'notapp@appacademy.io',
    :name => 'notGeorge',
    :phone_number => '987-123-1234',
    :user_id => 2},
  {:address => '444 Broadway',
    :email => 'maybeapp@appacademy.io',
    :name => 'maybeGeorge',
    :phone_number => '555-123-1234',
    :user_id => 2},
  {:address => '333 Broadway',
    :email => 'maybenotapp@appacademy.io',
    :name => 'maybenotGeorge',
    :phone_number => '333-123-1234',
    :user_id => 1}
])

favorites = Favorite.create([
  {user_id: 1, contact_id: 1},
  {user_id: 2, contact_id: 3}
])