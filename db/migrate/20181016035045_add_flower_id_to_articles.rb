class AddFlowerIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :flower_id, :integer
  end
end

