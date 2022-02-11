class AddKindToTyusens < ActiveRecord::Migration[6.1]
  def change
    add_column :tyusens, :kind, :string, after: :student_no
  end
end
