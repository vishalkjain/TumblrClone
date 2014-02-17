class Post < ActiveRecord::Base
   attr_accessible :title, :body, :photo_url, :link_url, :user_id

   validates :title, presence: true

   belongs_to :user
   # has_many :comments
#    has_many :tags

end
