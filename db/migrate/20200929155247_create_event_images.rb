class CreateEventImages < ActiveRecord::Migration[6.0]
  def change
    create_table :event_images do |t|
      t.integer :event_id, null: false, foreign_key: true
      t.string :image_url, null: false
      t.timestamps
    end
  end
end
