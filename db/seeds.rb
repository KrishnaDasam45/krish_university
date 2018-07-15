# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create!([{name:"admin",description:"admin description",is_active: true},
              {name:"faculty",description:"faculty description",is_active: true},
              {name:"student",description:"student description",is_active: true}])

Qualification.create!([{name:"Intermediate",description:"Intermediate description",is_active: true},
              {name:"Degree",description:"Degree description",is_active: true},
              {name:"B-Tech",description:"B-Tech description",is_active: true}])

Course.create!([{name:"M.P.C",description:"M.P.C description",qualification_id: 1,is_active: true},
	{name:"C.E.C",description:"C.E.C description",qualification_id: 1,is_active: true},
	{name:"Bi.P.C",description:"Bi.P.C description",qualification_id: 1,is_active: true},
              {name:"B.Sc",description:"B.Sc description",qualification_id: 2,is_active: true},
              {name:"B.Com",description:"B.Com description",qualification_id: 2,is_active: true},
              {name:"Mechanical",description:"Mech. description",qualification_id: 3,is_active: true},
              {name:"CSE",description:"CSE. description",qualification_id: 3,is_active: true},
              {name:"EEE",description:"EEE. description",qualification_id: 3,is_active: true}
              ])

User.create!({ :name=>"superadmin",:role_id=>1,:email => 'superadmin@example.com',:mobile=>"9696969696", :password => '123456', :password_confirmation => '123456',is_active: true})