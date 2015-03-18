class AddTimestampsToCreatePostCategories < ActiveRecord::Migration
  def change
    change_table :post_categories do |t|
    t.timestamps
    end
  end
end
