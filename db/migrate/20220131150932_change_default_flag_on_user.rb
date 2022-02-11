class ChangeDefaultFlagOnUser < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :role_flag, from: 0, to: 1
  end
end
