class CreateKensaks < ActiveRecord::Migration[6.1]
  def change
    create_table :kensaks do |t|
      t.string :question

      t.timestamps
    end
  end
end
