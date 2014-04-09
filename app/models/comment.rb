class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :article

  default_scope -> { order('created_at ASC') }
  validates :content, presence: true, length: { maximum: 200 }
  validates :article_id, presence: true
  validates :user_id, presence: true

end
