# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Badge.destroy_all
Booking.destroy_all
Mission.destroy_all
User.destroy_all

puts "USERS CREATION"
alice = User.create(lastname: "AA", firstname: "Alice", email: "alice@test.fr", password: "qwerty", phone: "0609090909", organisme: false)
benoit = User.create(lastname: "", firstname: "Maison de la nature", email: "benoit@test.fr", password: "azerty", phone: "0601010101", organisme: true)
nicolas = User.create(lastname: "NN", firstname: "Nicolas", email: "nicolas@test.fr", password: "azerty", phone: "0603030303", organisme: false)
saliha = User.create(lastname: "NN", firstname: "La Gamelle Bordelaise", email: "saliha@test.fr", password: "azerty", phone: "0603030303", organisme: true)

puts "MISSIONS CREATION"
Mission.create(user: benoit, title: "Ramassage de dechets en bord de plage", description: "On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même.On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même.On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même."  , category: "environnement 🌱", address: "Blockhaus Plage du Lion", city: "Lacanau", date: "06/07/2022", duration: 3, max_participant: 1)
Mission.create(user: benoit, title: "Sauvetage de baleine", description: "On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même.On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même.On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même."  , category: "animaux 🐶", address: "La Corniche", city: "Arcachon", date: "06/10/2022", duration: 2, max_participant: 4)
Mission.create(user: saliha, title: "Maraude dans Paris", description: "On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même.On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même.On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même." , category: "humanitaire 🫶🏻", address: "Avenue des Champs Elysées" , city: "Paris" , date: "06/07/2022" , duration: 2, max_participant: 1 )

puts "BOOKING CREATION"
Booking.create(user: alice, mission: Mission.first)
Booking.create(user: nicolas, mission: Mission.second)

puts "BADGES CREATION"
Badge.create(name: "1st help", threshold: 100)
Badge.create(name: "baby helper", threshold: 200)
puts "finish"
