class Announcement < ApplicationRecord
  has_many :user_announcements, dependent: :destroy

  enum role: [:teacher, :champion, :admin]

  validates :message, :role, :active, :expiration, presence: true

  def populate(announcement)
    select all from users where user.role == announcement.role 
    save
  end 
end
