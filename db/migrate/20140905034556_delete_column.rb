class DeleteColumn < ActiveRecord::Migration
  def change
    remove_column :prefectures, :pref_id
  end
end
