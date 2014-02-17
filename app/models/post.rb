class Post < ActiveRecord::Base
   attr_accessible :title, :body, :photo_url, :link_url

   belongs_to :user

   validates :title, presence: true
end
