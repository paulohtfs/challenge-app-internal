class V1::Users::DestroyService < BaseService
  def initialize(params)
    @params = params
    @id = params[:id]
  end

  def call
    destroy_user
  end

  private

  attr_reader :params, :id

  def destroy_user
    user.destroy
  end

  def user
    @user ||= User.find(id)
  end
end