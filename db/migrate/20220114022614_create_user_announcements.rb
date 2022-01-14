class CreateUserAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :user_announcements do |t|
      t.references :user, foreign_key: true
      t.references :announcement, foreign_key: true
      t.boolean :read, null: false, default: false

      t.timestamps
    end
  end
end
