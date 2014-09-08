class CreatePrefectures < ActiveRecord::Migration
  def change
    create_table :prefectures do |t|
      t.integer :pref_id
      t.string :pref_name

      t.timestamps
    end
  end
end
