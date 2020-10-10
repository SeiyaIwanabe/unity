class AddApplicantIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :applicant_id, :integer
  end
end
