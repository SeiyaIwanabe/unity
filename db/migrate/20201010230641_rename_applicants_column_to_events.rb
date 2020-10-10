class RenameApplicantsColumnToEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :applicants, :limit
  end
end
