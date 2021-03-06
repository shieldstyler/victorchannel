class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :author_id
      t.string :title
      t.datetime :published
      t.datetime :edited

      t.timestamps
    end
    add_index :articles, [:author_id, :created_at]
  end
end
