# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create username: 'joao', full_name: 'João', email: 'joao@sample.com', password: '123456', admin: false
User.create username: 'maria', full_name: 'Maria', email: 'maria@sample.com', password: '123456', admin: false
User.create username: 'pedro', full_name: 'Pedro', email: 'pedro@sample.com', password: '123456', admin: false
User.create username: 'admin', full_name: 'Admin', email: 'admin@sample.com', password: '123456', admin: true
p "Users created successfully"

Room.create (1..6).map { |s| { name: "Sala #{"%03d" % s}" } }
p "Rooms created successfully"
