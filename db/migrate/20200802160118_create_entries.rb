class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phoneNumber, null: false
      t.timestamps
    end
  end
end
