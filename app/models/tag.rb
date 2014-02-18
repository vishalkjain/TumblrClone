class Tag < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  has_many :taggings
  has_many :tagged_posts, through: :taggings, source: :post

end
