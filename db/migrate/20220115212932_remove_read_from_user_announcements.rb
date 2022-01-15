class RemoveReadFromUserAnnouncements < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_announcements, :read, if_exists: true
  end
end
