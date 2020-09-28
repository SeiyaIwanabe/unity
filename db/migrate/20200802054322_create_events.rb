class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :company, null: false
      t.datetime :day 
      t.string :place 
      t.string :reward 
      t.string :genre
      t.text :details
      t.string :applicants
      t.timestamps
    end
  end
end

