class User < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :last_name, :password, :password_confirmation, :username

  attr_accessor :password

  has_many :posts
  has_many :images, as: :imageable

  scope :active_user, -> { where email.present? }
  scope :birthdate, -> { active_user.where('birthdate <=?', Time.now - 18.year) }
  scope :age, -> { where (:bithday > Date.today - 18.years) }

  validates :email, presence: true, uniqueness: true
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true, length: { in: 8..20 }
  validates :password, confirmation: true

  def full_name
    "#{first_name} #{last_name}"
  end


  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    end
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end


end
