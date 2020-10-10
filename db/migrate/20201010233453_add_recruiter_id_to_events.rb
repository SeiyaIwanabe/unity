class AddRecruiterIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :recruiter_id, :integer
  end
end
