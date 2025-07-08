class V1::Users::ActivateService < BaseService
  def initialize(params)
    @params = params
    @id = params[:id]
  end

  def call
    return if user.active

    activate_user
  end

  private

  attr_reader :params, :id

  def activate_user
    user.update(active: true)
  end

  def user
    @user ||= User.find(id)
  end
end