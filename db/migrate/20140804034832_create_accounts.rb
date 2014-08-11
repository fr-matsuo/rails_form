class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :sex, :null => false
      t.string :post_first, :null => false
      t.string :post_last, :null => false
      t.integer :prefecture, :null => false
      t.string :email, :null => false
      t.string :hobby
      t.text :other_hobby
      t.text :opinion

      t.timestamps
    end
  end
end
