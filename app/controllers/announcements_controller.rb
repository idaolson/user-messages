class AnnouncementsController < ApplicationController
  def new

  end 

  def create
    announcement = Announcement.new(announcement_params)
    if announcement.save
  
      redirect_to new_announcement_path
      flash[:notice] = "Announcement saved!"

    else
      flash[:notice] = "Announcement not saved."

      redirect_to new_announcement_path
    end 
  end 

  private

  def announcement_params
    params.permit(:message, :role, :expiration, :active, :quantity)
  end 
end 



