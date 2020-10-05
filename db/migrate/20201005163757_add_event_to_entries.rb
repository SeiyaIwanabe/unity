class AddEventToEntries < ActiveRecord::Migration[6.0]
  def change
    add_reference :entries, :event, null: false, foreign_key: true
  end
end
