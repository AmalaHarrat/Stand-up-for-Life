# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Cleaning database..."
Badge.destroy_all
Booking.destroy_all
Mission.destroy_all
User.destroy_all

puts "USERS CREATION"
alice = User.create(lastname: "AA", firstname: "Alice", email: "alice@test.fr", password: "qwerty", phone: "0609090909", organisme: false)
benoit = User.create(lastname: "", firstname: "Maison de la nature", email: "benoit@test.fr", password: "azerty", phone: "0601010101", organisme: true)
nicolas = User.create(lastname: "NN", firstname: "Nicolas", email: "nicolas@test.fr", password: "azerty", phone: "0603030303", organisme: false)
saliha = User.create(lastname: "", firstname: "La Gamelle Bordelaise", email: "saliha@test.fr", password: "azerty", phone: "0603030303", organisme: true)
Samy = User.create(lastname: "", firstname: "Le Ballon Togolais", email: "samy@test.fr", password: "azerty", phone: "0603030345", organisme: true)

puts "MISSIONS CREATION"
# Mission.create(user: benoit, title: "Ramassage de dechets en bord de plage", description: "On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même.On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même.On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même."  , category: "environnement 🌱", address: "Blockhaus Plage du Lion", city: "Lacanau", date: "06/07/2022", duration: 3, max_participant: 1)
Mission.create(user: benoit, title: "Sauvetage de baleine", description: "On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même.On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même.On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même."  , category: "animaux 🐶", address: "La Corniche", city: "Arcachon", date: "06/10/2022", hour: 15, duration: 2, max_participant: 4)
Mission.create(user: saliha, title: "Maraude dans Paris", description: "Nous avons besoin de bras et de sourires pour une maraude prévue dimanche. Si des personnes sont intéressées, n'hésitez pas à nous contacter pour plus de détails. " , category: "humanitaire 🙏🏻", address: "Avenue des Champs Elysées" , city: "Paris" , date: "06/07/2022" , hour: 15, duration: 2, max_participant: 3 )
Mission.create(user: saliha, title: "Maraude dans Villenave", description: "Nous avons besoin de bras et de sourires pour une maraude prévue dimanche. Si des personnes sont intéressées, n'hésitez pas à nous contacter pour plus de détails. " , category: "humanitaire 🙏🏻", address: "gambetta" , city: "Bordeaux" , date: "06/01/2023" , hour: 15, duration: 2, max_participant: 4 )
Mission.create(user: benoit, title: "Soigne les chatons abandonnés ou perdues", description: "Nous en avons actuellement 43.il y en a qui ont des problèmes de santé (cardiaque, diabète coryza, même un, qu'un chasseur a pris pour cible . Il a eu le fémur cassé le vétérinaire a enlevé le plomb et plâtré le chat.)Parfois ils nous arrivent blessés donc nous devons réagir vite heureusement nous avons notre vétérinaire.En cliquant sur les photos, vous aurez leurs noms et d'autres informations. Nous en avons aussi des jeunes."  , category: "animaux 🐶", address: "2, ( lieu-dit ) la Cartrie ", city: "CHAHAIGNES", date: "30/12/2022", hour: 15, duration: 2, max_participant: 3)
Mission.create(user: saliha, title: "Maraude dans Bordeaux", description: "Nous avons besoin de bras et de sourires pour une maraude prévue dimanche. Si des personnes sont intéressées, n'hésitez pas à nous contacter pour plus de détails. " , category: "humanitaire 🙏🏻", address: "Place de la Victoire" , city: "Bordeaux" , date: "06/01/2023" , hour: 15, duration: 2, max_participant: 4 )
Mission.create(user: saliha, title: "Tournois de football caritatif", description: "Bienvenue dans notre projet de solidarité international, qui sera pour le Togo ! Venez participer à notre tournois de foot qui permttra de recolletter des fonds pour construire un puis au Togo" , category: "humanitaire 🙏🏻", address: "Complexe Ginga foot" , city: "Merignac" , date: "17/01/2023" , hour: 15, duration: 5, max_participant: 15 )

puts "BOOKING CREATION"
Booking.create(user: alice, mission: Mission.first)
Booking.create(user: alice, mission: Mission.second, scoring: 30)

puts "BADGES CREATION"
# Attention le seuil est celui des badges pas des scores
puts "1st badge"
file = URI.open("https://raw.githubusercontent.com/amalharrat/Stand-up-for-Life/master/app/assets/images/first.png")
first_badge = Badge.new(name: "1st mission", threshold: 100)
first_badge.photo.attach(io: file, filename: "firstbadge.jpg", content_type: "image/jpg")
first_badge.save

puts "baby helper badge"
file = URI.open("https://static9.depositphotos.com/1229718/1127/i/950/depositphotos_11274573-stock-photo-police-badge.jpg")
babyhelper_badge = Badge.new(name: "Baby helper", threshold: 200)
babyhelper_badge.photo.attach(io: file, filename: "babyhelper.jpg", content_type: "image/jpg")
babyhelper_badge.save

# puts "junior helper badge"
# file = URI.open("https://static9.depositphotos.com/1229718/1127/i/950/depositphotos_11274573-stock-photo-police-badge.jpg")
# juniorhelper_badge = Badge.new(name: "Baby helper", threshold: 300)
# juniorhelper_badge.photo.attach(io: file, filename: "juniorhelper.jpg", content_type: "image/jpg")
# juniorhelper_badge.save

puts "finish"
