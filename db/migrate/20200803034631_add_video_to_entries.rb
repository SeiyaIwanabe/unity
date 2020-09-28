class AddVideoToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :video, :string
  end
end
