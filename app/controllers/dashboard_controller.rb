class DashboardController < ApplicationController
  def index
    @user = current_user
    @current_announcements = Announcement.get_announcements(@user)

    @current_announcements.each do |a|
      UserAnnouncement.create(user_id: @user.id, announcement_id: a.id)
    end 
  end
end
