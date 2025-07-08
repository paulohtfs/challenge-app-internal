class UsersPolicy
  attr_reader :user

  def initialize(user, _record)
    @user = user
  end

  def activate?
    user.admin?
  end

  def inactivate?
    user.admin?
  end
end