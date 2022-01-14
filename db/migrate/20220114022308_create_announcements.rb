class CreateAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.string :message
      t.integer :role
      t.boolean :active, null: false, default: false
      t.datetime :expiration

      t.timestamps
    end
  end
end
