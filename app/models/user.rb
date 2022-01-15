class User < ApplicationRecord
  has_many :user_announcements, dependent: :destroy

  enum role: [:teacher, :champion, :admin]

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  validates :password, confirmation: { case_sensitive: true }
  
end
