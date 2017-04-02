class User < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :last_name, :password, :username
  has_many :posts
  has_many :images, :as => :imageable

  validates :email, :uniqueness => true, :presence => true
  validates :username, :uniqueness => true, :presence => true
  validates :password, :lenght => { :minimum => 8 }, :presence => true

  scope :age, -> {where ()}
end
