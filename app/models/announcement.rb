class Announcement < ApplicationRecord
  has_many :user_announcements, dependent: :destroy

  enum role: [:teacher, :champion, :admin]

  validates :message, :role, :active, :expiration, :quantity, presence: true

  def self.get_announcements(user)
    announcements = where(role: user.role)
    current_announcements = []
    announcements.each do |a| 
      ua = find_by_sql("
        SELECT user_announcements.* FROM user_announcements
        WHERE (user_announcements.announcement_id = #{a.id}) AND (user_announcements.user_id = #{user.id})
      ")
      if ua.length >= a.quantity
        next
      else 
        current_announcements << a
      end 
    end 
    return current_announcements
  end 
end
