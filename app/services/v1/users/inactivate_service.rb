class V1::Users::InactivateService < BaseService
  def initialize(params)
    @params = params
    @id = params[:id]
  end

  def call
    return unless user.active

    inactivate_user
  end

  private

  attr_reader :params, :id

  def inactivate_user
    user.update(active: false)
  end

  def user
    @user ||= User.find(id)
  end
end