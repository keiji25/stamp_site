class CreatePrizes < ActiveRecord::Migration[6.1]
  def change
    create_table :prizes do |t|
      t.string :prize
      t.integer :qty
      t.string :category
      t.string :image
      t.timestamps
    end
  end
end
