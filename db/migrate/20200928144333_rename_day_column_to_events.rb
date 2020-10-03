class RenameDayColumnToEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :day, :datetime
  end
end
