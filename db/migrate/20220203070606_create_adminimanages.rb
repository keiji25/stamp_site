class CreateAdminimanages < ActiveRecord::Migration[6.1]
  def change
    create_table :adminimanages do |t|
      t.string :user_id
      t.datetime :in
      t.datetime :out
      t.integer :role

      t.timestamps
    end
  end
end
