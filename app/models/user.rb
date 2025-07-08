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

  scope :by_name, -> name { where('name ilike ?', sanitize_sql_like(name) + '%') }
  scope :by_role, -> role { where(role: "User::#{role.camelize}") }
  scope :by_email, -> email { where('email ilike ?', sanitize_sql_like(email) + '%') }
  scope :by_whatever, -> whatever {
    where('email ilike ?', sanitize_sql_like(whatever) + '%')
      .or(where('name ilike ?', sanitize_sql_like(whatever) + '%'))
      .or(where(role: "User::#{whatever.camelize}"))
  }

  scope :order_name, -> order { order(name: order) }
  scope :order_role, -> order { order(role: order) }
  scope :order_email, -> order { order(email: order) }
  
  def admin?
    role == "User::Admin"
  end

  def member?
    role == "User::Member"
  end
end