# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Appointment.destroy_all
Doctor.destroy_all
Patient.destroy_all
City.destroy_all
JoinTableDocSpec.destroy_all
Speciality.destroy_all

puts "suppression faite"
5.times do
  City.create(
    city: Faker::Address.city,
  )
end

puts "création de city"
tp City.all

5.times do
  Speciality.create(speciality: Faker::Job.field)
end
tp Speciality.all
puts "création de speciality"

# ancienne version
#10.times do
#  Doctor.create(
#    first_name: Faker::Name.first_name,
#    last_name: Faker::Name.last_name,
#    specialty: Faker::Job.field,
#    zip_code:Faker::Address.zip_code
#  )
#end
5.times do
  Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city_id: City.find(rand(City.first.id..City.last.id)).id
  )
end

tp Doctor.all
puts "création des doc faite"

10.times do
  JoinTableDocSpec.create(
    doctor_id: Doctor.find(rand(Doctor.first.id..Doctor.last.id)).id,
    specialty_id: Speciality.find(rand(Speciality.first.id..Speciality.last.id)).id
  )
end

puts "création des jointable"

10.times do
  Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city_id: City.find(rand(City.first.id..City.last.id)).id
  )
end

puts "création des patients faite"

10.times do
  Appointment.create(
    doctor_id:  Doctor.find(rand(Doctor.first.id..Doctor.last.id)).id,
    patient_id: Patient.find(rand(Patient.first.id..Patient.last.id)).id,
    date:    Faker::Time.between(from: DateTime.now, to: DateTime.now + 30),
    city_id: City.find(rand(City.first.id..City.last.id)).id
  )
end

puts "création des rdv faite"