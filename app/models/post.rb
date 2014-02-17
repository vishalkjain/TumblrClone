class Post < ActiveRecord::Base
   attr_accessible :title, :body, :photo_url, :link_url

   validates :title, presence: true
end
