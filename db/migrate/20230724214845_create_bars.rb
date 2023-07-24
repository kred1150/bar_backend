class CreateBars < ActiveRecord::Migration[7.0]
  def change
    create_table :bars do |t|
      t.string "name"
      t.decimal "price", precision: 9, scale: 2
      t.text "description"
      t.string "image_url"
      t.timestamps
    end
  end
end
