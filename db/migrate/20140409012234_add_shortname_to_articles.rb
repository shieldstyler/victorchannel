class AddShortnameToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :shortname, :string
  end
end