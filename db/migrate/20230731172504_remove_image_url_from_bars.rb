class RemoveImageUrlFromBars < ActiveRecord::Migration[7.0]
  def change
    remove_column :bars, :image_url, :string
  end
end
