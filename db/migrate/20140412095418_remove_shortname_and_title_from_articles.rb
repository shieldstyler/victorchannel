class RemoveShortnameAndTitleFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :shortname, :string
    remove_column :articles, :title, :string
  end
end
