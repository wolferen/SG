class Post < ActiveRecord::Base
  attr_accessible :body, :published_at, :title, :user_id, :images_attributes
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images
  belongs_to :user

  scope :published, (-> { where('published_at IS NOT NULL') })
  validates :title, :body, presence: true

  self.per_page = 10
end
