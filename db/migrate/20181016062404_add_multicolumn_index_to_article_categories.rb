class AddMulticolumnIndexToArticleCategories < ActiveRecord::Migration
  def change
    add_index :article_categories, [:category_id, :article_id], unique: true
  end
end
