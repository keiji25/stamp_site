class CreateTyusens < ActiveRecord::Migration[6.1]
  def change
    create_table :tyusens do |t|
      t.string :student_no
      t.string :prize

      t.timestamps
    end
  end
end
