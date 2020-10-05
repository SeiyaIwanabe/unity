class RemoveNameFromEntries < ActiveRecord::Migration[6.0]
  def change
    remove_column :entries, :name, :string
  end
end
