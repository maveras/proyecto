# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
UserInterest.delete_all
Interest.delete_all
Request.delete_all
RequestApply.delete_all

User.reset_pk_sequence
UserInterest.reset_pk_sequence
Interest.reset_pk_sequence
Request.reset_pk_sequence
RequestApply.reset_pk_sequence


user1 = User.create!(name: "Marcelo", password: "123456789" ,email: "marcelo.verasalvatierra@gmail.com")
user2 = User.create!(name: "Juan", password: "123456789" ,email: "juan@gmail.com")
user3 = User.create!(name: "Pepito", password: "123456789" ,email: "pepito@gmail.com")
user4 = User.create!(name: "Pedrito", password: "123456789" ,email: "pedrito@gmail.com")
user5 = User.create!(name: "susana", password: "123456789" ,email: "su@gmail.com")
user6 = User.create!(name: "javiera", password: "123456789" ,email: "javiera@gmail.com")

interest1 = Interest.create!(name: "Basketball")
interest2 = Interest.create!(name: "Football")
interest3 = Interest.create!(name: "Running")
interest4 = Interest.create!(name: "Motitos")
interest5 = Interest.create!(name: "video juegos")

user_intere1 = UserInterest.create!(user: user1, interest: interest1)
user_intere2 = UserInterest.create!(user: user2, interest: interest1)
user_intere3 = UserInterest.create!(user: user2, interest: interest2)
user_intere4 = UserInterest.create!(user: user1, interest: interest2)
user_intere5 = UserInterest.create!(user: user1, interest: interest3)

d1 = DateTime.new(2015,6,22)
d2 = DateTime.new(2015,12,16)
d3 = DateTime.new(2015,8,12)

request1 = Request.create!(user:user2,interest:interest2,description:"me gustaria jugar al futbol juan",date_activity:d1, state_request:1, location:"mi casa", date_activity_end:d2, title:"tituloooo")
request2 = Request.create!(user:user2,interest:interest2,description:"me gustaria jugar al futbol marceliuno",date_activity:d1, state_request:1, location:"mi casa", date_activity_end:d2, title:"tituloooo")

request3 = Request.create!(user:user3,interest:interest1,description:"me gustaria jugar al Basketball",date_activity:d1, state_request:1, location:"mi casa", date_activity_end:d2, title:"tituloooo")
request4 = Request.create!(user:user4,interest:interest3,description:"me gustaria ir a correr pedro",date_activity:d1, state_request:1, location:"mi casa", date_activity_end:d2, title:"tituloooo")
request5 = Request.create!(user:user4,interest:interest3,description:"me gustaria trotar perdro",date_activity:d1, state_request:1, location:"mi casa", date_activity_end:d2, title:"tituloooo")
request6 = Request.create!(user:user1,interest:interest1,description:"me gustaria jugar a las bolitas",date_activity:d1, state_request:1, location:"mi casa", date_activity_end:d2, title:"tituloooo")


reqAp1 = RequestApply.create!(user:user1,request:request1,state: 1)
reqAp2 = RequestApply.create!(user:user4,request:request1,state: 1)
reqAp3 = RequestApply.create!(user:user3,request:request1,state: 1)
reqAp5 = RequestApply.create!(user:user3,request:request2,state: 1)
reqAp6 = RequestApply.create!(user:user1,request:request3,state: 1)
reqAp7 = RequestApply.create!(user:user2,request:request3,state: 1)
