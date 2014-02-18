class Tag < ActiveRecord::Base
  attr_accessible :tag_name

  validates :tag_name, presence: true

  has_many :taggings
  has_many :tagged_posts, through: :taggings, source: :post

end
