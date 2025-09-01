# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

puts "Seeding database..."

# ---- Admin Users ----
AdminUser.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.password = "password123"
  admin.password_confirmation = "password123"
end
puts "✅ Admin user created"

# ---- Car Makers ----
toyota = Make.find_or_create_by!(name: "Toyota")
bmw    = Make.find_or_create_by!(name: "BMW")
audi   = Make.find_or_create_by!(name: "Audi")
opel   = Make.find_or_create_by!(name: "Opel")
ford   = Make.find_or_create_by!(name: "Ford")
Mercedes = Make.find_or_create_by!(name: "Mercedes")
puts "✅ Makes created"

# ---- Car Models ----
CarModel.find_or_create_by!(name: "Corolla", make: toyota)
CarModel.find_or_create_by!(name: "Camry", make: toyota)
CarModel.find_or_create_by!(name: "3 Series", make: bmw)
CarModel.find_or_create_by!(name: "X5", make: bmw)
CarModel.find_or_create_by!(name: "A4", make: audi)
CarModel.find_or_create_by!(name: "Q7", make: audi)
CarModel.find_or_create_by!(name: "Astra", make: opel)
CarModel.find_or_create_by!(name: "Corsa", make: opel)
CarModel.find_or_create_by!(name: "Insignia", make: opel)
CarModel.find_or_create_by!(name: "C-Class", make: Mercedes)
CarModel.find_or_create_by!(name: "E-Class", make: Mercedes)
CarModel.find_or_create_by!(name: "GLE", make: Mercedes)
puts "✅ Car models created"
# --Cites--
City.find_or_create_by!(name: "Alexandria")
City.find_or_create_by!(name: "Cairo")

puts "🌱 Seeding done!"
