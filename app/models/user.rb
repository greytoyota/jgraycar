class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # +login+ is used to authenticate users when logging in.
  # It can be either a username or a password.
  attr_accessor :login

  # This method was originally defined by the Devise gem.
  # It is overwritten here to allow the use of either username or email for login
  # (default is only email)
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  validates :username, presence: true, uniqueness: { case_sensitive: false };

end
