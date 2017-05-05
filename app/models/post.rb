class Post < ActiveRecord::Base
  attr_accessible :body, :published_at, :title
  has_many :images, :as => :imageable
  belongs_to :user

  scope :published_all, -> { where('published_at IS NOT NULL') }

  self.per_page = 10

end
