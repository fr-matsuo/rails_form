class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.string :post_first
      t.string :post_last
      t.integer :prefecture
      t.string :email
      t.string :hobby
      t.text :other_hobby
      t.text :opinion

      t.timestamps
    end
  end
end
