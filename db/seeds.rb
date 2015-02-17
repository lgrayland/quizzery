# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.delete_all

User.create!(email: 'a@a.com', password: 'password', nick_name: 'HHHHipchat')
User.create!(email: 'b@b.com', password: 'password', nick_name: '90 percent')
User.create!(email: 'c@c.com', password: 'password', nick_name: 'Your Fired')
