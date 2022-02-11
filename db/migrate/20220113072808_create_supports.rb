class CreateSupports < ActiveRecord::Migration[6.1]
  def change
    create_table :supports do |t|
      t.text :question
      t.text :answer
      t.string :kind
      t.integer :order

      t.timestamps
    end
  end
end
