class Announcement < ApplicationRecord
  has_many :user_announcements, dependent: :destroy

  enum role: [:teacher, :champion, :admin]

  validates :message, :role, :active, :expiration, presence: true

  def self.get_announcements(user)
    announcements = where(role: user.role)
    current_announcements = []
    announcements.each do |a| 
      ua = find_by_sql("
        SELECT user_announcements.* FROM user_announcements
        WHERE (user_announcements.announcement_id = #{a.id}) AND (user_announcements.user_id = #{user.id})
      ")
      # ua = select "user_announcements".* from "announcements" where "user_announcements"."announcement_id" = a.id and user_id = user.id
      if ua.length > 0
        next
      else 
        current_announcements << a
        # UserAnnoucement.create(user_id: user.id, announcement_id: a.id)
      end 
    end 
    return current_announcements
  end 
end


# SELECT t1.name
# FROM table1 t1
# LEFT JOIN table2 t2 ON t2.name = t1.name
# WHERE t2.name IS NULL

# SELECT "announcments".* FROM "announcments" LEFT OUTER JOIN "user_announcements" ON "user_announcements"."announcement_id" = "announcements"."id"
# WHERE "user_announcements.id" IS NULL and 

#take all announcements where the user role and announcement role are the same. 

# If you don't have a user_announcement with the user id and the announcement id. 
# create it. and return the annoucnement. 