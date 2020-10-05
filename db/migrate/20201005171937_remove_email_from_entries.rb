class RemoveEmailFromEntries < ActiveRecord::Migration[6.0]
  def change
    remove_column :entries, :email, :string
  end
end
