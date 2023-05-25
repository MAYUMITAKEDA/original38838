class AddAreaIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :area_id, :integer, null: false
  end
end
