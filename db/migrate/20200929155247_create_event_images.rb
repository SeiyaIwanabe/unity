class CreateEventImages < ActiveRecord::Migration[6.0]
  def change
    create_table :event_images do |t|
      t.references :event, null: false, foreign_key: true
      t.string :src, null: false
      t.timestamps
    end
  end
end
