class User < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :last_name, :password, :username, :password_confirmation

  attr_accessor :password

  before_save :encrypt_password

  has_many :posts
  has_many :images, as: :imageable

  validates :email, presence: true, uniqueness: true
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true, length: { in: 8..20 }
  validates :password, confirmation: true

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  scope :active_user, -> { where email.present? }
  scope :birthdate, -> { active_user.where('birthdate <=?', Time.now - 18.year) }
  scope :age, -> { where (:bithday > Date.today - 18.years) }
end
