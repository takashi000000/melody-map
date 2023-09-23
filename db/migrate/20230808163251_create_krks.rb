class CreateKrks < ActiveRecord::Migration[6.1]
  def change
    create_table :krks do |t|
      t.string :name
      t.string :genre
      t.text :about

      t.timestamps
    end
  end
end
