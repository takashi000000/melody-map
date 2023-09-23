class AddUserIdToKrks < ActiveRecord::Migration[6.1]
  def change
    add_column :krks, :user_id, :integer
  end
end
