class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :accounts, :prefecture, :prefecture_id
  end
end
