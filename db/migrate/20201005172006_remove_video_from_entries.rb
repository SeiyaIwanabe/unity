class RemoveVideoFromEntries < ActiveRecord::Migration[6.0]
  def change
    remove_column :entries, :video, :string
  end
end
