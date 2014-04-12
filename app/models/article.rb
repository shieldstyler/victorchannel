class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments

  validates :author_id, presence: true
  validates :titlelong, presence: true
  validates :titleshort, presence: true
  validates :published, presence: true
  validates :edited, presence: true

  extend FriendlyId
  friendly_id :titleshort, use: :slugged
end
