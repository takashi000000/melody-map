class AddImageToKrks < ActiveRecord::Migration[6.1]
  def change
    add_column :krks, :image, :string
  end
end
