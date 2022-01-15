# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UserAnnouncement.destroy_all
Announcement.destroy_all
User.destroy_all

@ann1 = Announcement.create!(message: "Announcement 1.", role: "teacher", active: true, expiration: "2022-01-30 00:00:00")
@ann2 = Announcement.create!(message: "Announcement 2.", role: "teacher", active: true, expiration: "2022-01-30 00:00:00")
@ann3 = Announcement.create!(message: "Announcement 3.", role: "teacher", active: true, expiration: "2022-01-30 00:00:00")
@ann4 = Announcement.create!(message: "Announement 4.", role: "teacher", active: true, expiration: "2022-01-30 00:00:00")

@ann5 = Announcement.create!(message: "Announcement 5.", role: "champion", active: true, expiration: "2022-01-30 00:00:00")
@ann6 = Announcement.create!(message: "Announcement 6.", role: "champion", active: true, expiration: "2022-01-30 00:00:00")
@ann7 = Announcement.create!(message: "Announcement 7.", role: "champion", active: true, expiration: "2022-01-30 00:00:00")
@ann8 = Announcement.create!(message: "Announcement 8.", role: "champion", active: true, expiration: "2022-01-30 00:00:00")


@user1 = User.create!(first_name: "Doug", last_name: "Olson", role: "teacher", password: "chibi", password_confirmation: "chibi", email: "dougolson@mail.com" )
@user2 = User.create!(first_name: "Ida", last_name: "Olson", role: "champion", password: "chibi", password_confirmation: "chibi", email: "idaolson@mail.com" )

@ua1 = UserAnnouncement.create!(user_id: @user1.id, announcement_id: @ann1.id)
@ua2 = UserAnnouncement.create!(user_id: @user2.id, announcement_id: @ann7.id)

