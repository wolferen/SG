class User < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :last_name, :password, :username
  has_many :posts
  has_many :images, :as => :imageable

  validates :email, :uniqueness => true, :presence => true
  validates :username, :uniqueness => true, :presence => true
  validates :password, :length => { :minimum => 8 }, :presence => true

  # scope :age, -> {where (:bithday > Date.today - 18.years)}

  # def full_name
  #   "#{first_name} #{last_name}"
  # end

  scope :active_user, -> { where email.present? }
  scope :birthdate, -> { active_user.where('birthdate <=?', Time.now - 18.year) }


end
