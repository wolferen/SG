class Post < ActiveRecord::Base
  attr_accessible :body, :published_at, :title
  has_many :images, :as => :imageable
  belongs_to :user
end
