class Rocords < ActiveRecord::Migration[6.0]
  def change
    drop_table :event_images
  end
end
