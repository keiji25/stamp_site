class CreateGetStamps < ActiveRecord::Migration[6.1]
  def change
    create_table :get_stamps do |t|
      t.string :student_no
      t.integer :number
      t.string :stamp_id

      t.timestamps
    end
  end
end
