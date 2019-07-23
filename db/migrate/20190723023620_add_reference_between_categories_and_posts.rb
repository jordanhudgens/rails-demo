class AddReferenceBetweenCategoriesAndPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :category
    remove_column :articles, :categories
  end
end
