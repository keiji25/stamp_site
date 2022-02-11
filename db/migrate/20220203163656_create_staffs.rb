class CreateStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :staffs do |t|
      t.string :staff_id
      t.string :group
      t.text :info

      t.timestamps
    end
  end
end
