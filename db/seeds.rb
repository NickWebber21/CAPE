# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

admin_course = Course.find_or_create_by(name: 'Admin')

admin = User.find_or_initialize_by(email: 'admin@admin.com') do |user|
    user.password = 'adminpassword'
    user.password_confirmation = 'adminpassword'
    user.course_id = admin_course.id
    user.first = 'Admin'
    user.last = 'Admin'
    user.role = 'Admin'
  end
  
  admin.save!
