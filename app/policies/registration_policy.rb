class RegistrationPolicy < ApplicationPolicy
  def inactivate?
    user.admin?
  end

  def delete?
    user.admin?
  end
end