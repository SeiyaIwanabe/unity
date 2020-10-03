class ChangeDatatypeRewardOfEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :reward, :integer
  end
end
