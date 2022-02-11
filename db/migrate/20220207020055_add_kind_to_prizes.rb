class AddKindToPrizes < ActiveRecord::Migration[6.1]
  def change
    add_column :prizes, :kind, :string, after: :id
  end
end
