# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

steven = User.create(first_name: "Steven", last_name: "Nugent", email: "steven@email.com", password: "password", family_group: "Nugent/Lim/Saito")
List.create(user_id: steven.id)

karen = User.create(first_name: "Karen", last_name: "Nugent", email: "karen@email.com", password: "password", family_group: "Nugent/Lim/Saito")
List.create(user_id: karen.id)

doug = User.create(first_name: "Doug", last_name: "Nugent", email: "doug@email.com", password: "password", family_group: "Nugent/Lim/Saito")
List.create(user_id: doug.id)

holly = User.create(first_name: "Holly", last_name: "Saito", email: "holly@email.com", password: "password", family_group: "Nugent/Lim/Saito")
List.create(user_id: holly.id)

mitsu = User.create(first_name: "Mitsu", last_name: "Saito", email: "mitsu@email.com", password: "password", family_group: "Nugent/Lim/Saito")
List.create(user_id: mitsu.id)

julie = User.create(first_name: "Julie", last_name: "Lim", email: "julie@email.com", password: "password", family_group: "Nugent/Lim/Saito")
List.create(user_id: julie.id)

dave = User.create(first_name: "Dave", last_name: "Lim", email: "dave@email.com", password: "password", family_group: "Nugent/Lim/Saito")
List.create(user_id: dave.id)

duane = User.create(first_name: "Duane", last_name: "Nugent", email: "duane@email.com", password: "password", family_group: "Nugent/Lim/Saito")
List.create(user_id: duane.id)

kay = User.create(first_name: "Kay", last_name: "Nugent", email: "kay@email.com", password: "password", family_group: "Nugent/Lim/Saito")
List.create(user_id: kay.id)

kristin = User.create(first_name: "Kristin", last_name: "Nugent", email: "kristin@email.com", password: "password", family_group: "Nugent/Lim/Saito")
List.create(user_id: kristin.id)

paul = User.create(first_name: "Paul", last_name: "Dragseth", email: "paul@email.com", password: "password", family_group: "Dragseth")
List.create(user_id: paul.id)

paula = User.create(first_name: "Paula", last_name: "Dragseth", email: "paula@email.com", password: "password", family_group: "Dragseth")
List.create(user_id: paula.id)

elizabeth = User.create(first_name: "Elizabeth", last_name: "Dragseth", email: "elizabeth@email.com", password: "password", family_group: "Dragseth")
List.create(user_id: elizabeth.id)

greg = User.create(first_name: "Greg", last_name: "Dragseth", email: "greg@email.com", password: "password", family_group: "Dragseth")
List.create(user_id: greg.id)

derek = User.create(first_name: "Derek", last_name: "Dragseth", email: "derek@email.com", password: "password", family_group: "Dragseth")
List.create(user_id: derek.id)

dianne = User.create(first_name: "Dianne", last_name: "King", email: "dianne@email.com", password: "password", family_group: "King")
List.create(user_id: dianne.id)

mike = User.create(first_name: "Mike", last_name: "King", email: "mike@email.com", password: "password", family_group: "King")
List.create(user_id: mike.id)

michael = User.create(first_name: "Michael", last_name: "King", email: "michael@email.com", password: "password", family_group: "King")
List.create(user_id: michael.id)

emily = User.create(first_name: "Emily", last_name: "King", email: "emily@email.com", password: "password", family_group: "King")
List.create(user_id: emily.id)

bev = User.create(first_name: "Bev", last_name: "Dragseth", email: "bev@email.com", password: "password", family_group: "Dragseth")
List.create(user_id: bev.id)