class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  self.inheritance_column = "role"

  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :jwt_authenticatable,
          jwt_revocation_strategy: self

  validates :name, :email, :role, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP
  
  def admin?
    role == "User::Admin"
  end

  def member?
    role == "User::Member"
  end
end