# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "admin@test.com", password: "password")

user_names = %w( tanaka yamada satou suzuki )

user_names.each.with_index(1) { | name, i | User.create!(name: name, email: "user#{i}@test.com", password: "password") }