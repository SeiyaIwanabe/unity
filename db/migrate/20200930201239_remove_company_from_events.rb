class RemoveCompanyFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :company, :string
  end
end
