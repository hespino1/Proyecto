# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  User.create(:nombre => 'Alberto', :cedula => 123456, :correo => 'ninguno@admin.com',
                     :password =>'123456')

  User.create(:nombre => 'Jhonatan', :cedula => 1234435, :correo => 'jhonatan@gmail.com',
              :password =>'123456')
  User.create(:nombre => 'hugo', :cedula => 12346, :correo => 'hugo@gmail.com',
              :password =>'123456')
  User.create(:nombre => 'duvan', :cedula => 12334456, :correo => 'duvan@admin.com',
              :password =>'123456')

  User.create(:nombre => 'daniel', :cedula => 1234235, :correo => 'daniel@gmail.com',
              :password =>'123456')
  User.create(:nombre => 'juan', :cedula => 12346, :correo => 'juan@gmail.com',
              :password =>'123456')
  User.create(:nombre => 'manuel', :cedula => 1234113356, :correo => 'manuel@admin.com',
              :password =>'123456')

  User.create(:nombre => 'pedro', :cedula => 5412345, :correo => 'pedro@gmail.com',
              :password =>'123456')
  User.create(:nombre => 'luis', :cedula => 1237646, :correo => 'luis@gmail.com',
              :password =>'123456')
  User.create(:nombre => 'monda', :cedula => 12398456, :correo => 'monda@admin.com',
              :password =>'123456')

  User.create(:nombre => 'felipe', :cedula => 1236745, :correo => 'felipe@gmail.com',
              :password =>'123456')
  User.create(:nombre => 'mosquera', :cedula => 1200346, :correo => 'mosquera@gmail.com',
              :password =>'123456')