class AddUserIdToBars < ActiveRecord::Migration[7.0]
  def change
    add_column :bars, :user_id, :integer
  end
end
