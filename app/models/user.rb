class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  self.inheritance_column = "role"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :jwt_authenticatable,
          jwt_revocation_strategy: self
  
  def admin?
    role == "User::Admin"
  end

  def member?
    role == "User::Member"
  end
end