class AddQuantityToAnnouncements < ActiveRecord::Migration[5.2]
  def change
    add_column :announcements, :quantity, :integer
  end
end
