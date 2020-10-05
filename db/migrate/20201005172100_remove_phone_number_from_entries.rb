class RemovePhoneNumberFromEntries < ActiveRecord::Migration[6.0]
  def change
    remove_column :entries, :phoneNumber, :string
  end
end
