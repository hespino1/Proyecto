# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  User.create(:nombre => 'Alberto', :cedula => 123456, :correo => 'ninguno@admin.com',
                     :password =>'123456')

  User.create(:nombre => 'Jhonatan', :cedula => 12345, :correo => 'canada@gmail.com',
              :password =>'123456')
  User.create(:nombre => 'hugo', :cedula => 12346, :correo => 'hugi@gmail.com',
              :password =>'123456')