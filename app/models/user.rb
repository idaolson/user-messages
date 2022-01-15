class User < ApplicationRecord
  has_many :user_announcements, dependent: :destroy

  enum role: [:teacher, :champion, :admin]
end
