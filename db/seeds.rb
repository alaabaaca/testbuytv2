# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  User.delete_all
  user1 = User.create(email: 'test01@example.com', password: '123456789', password_confirmation: '123456789')
  user2 = User.create(email: 'test02@example.com', password: '123456789', password_confirmation: '123456789')
  user3 = User.create(email: 'test03@example.com', password: '123456789', password_confirmation: '123456789')
  user4 = User.create(email: 'test04@example.com', password: '123456789', password_confirmation: '123456789')


  Role.delete_all
  role1 = Role.create(name: "Role1")
  role2 = Role.create(name: "Role2")
  role3 = Role.create(name: "Role3")
  role4 = Role.create(name: "Role4")

  RolesUser.delete_all
  RolesUser.create(user_id: user1.id, role_id: role1.id)
  RolesUser.create(user_id: user2.id, role_id: role2.id)
  RolesUser.create(user_id: user3.id, role_id: role3.id)
  RolesUser.create(user_id: user4.id, role_id: role4.id)