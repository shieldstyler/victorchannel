class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments

  validates :author_id, presence: true
  validates :title, presence: true
  validates :published, presence: true
  validates :edited, presence: true
end
