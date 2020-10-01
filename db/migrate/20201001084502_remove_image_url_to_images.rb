class RemoveImageUrlToImages < ActiveRecord::Migration[6.0]
  def change
    remove_column :images, :image_url, :string
  end
end
