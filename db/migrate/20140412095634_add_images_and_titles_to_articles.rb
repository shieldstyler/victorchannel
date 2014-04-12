class AddImagesAndTitlesToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :titlelong, :string
    add_column :articles, :titleshort, :string
    add_column :articles, :imgprimary, :string
    add_column :articles, :imgthumb, :string
  end
end
