class Api::V1::UsersController < ApplicationController
  has_scope :by_name
  has_scope :by_role
  has_scope :by_email
  has_scope :by_whatever

  has_scope :order_name
  has_scope :order_role
  has_scope :order_email

  rescue_from Pundit::NotAuthorizedError, with: :deny_access

  def index
    @users = apply_scopes(User).all
  end

  def create
    @user = V1::Users::CreateService.call(params[:user])
  end

  def activate
    authorize :users, :activate?

    V1::Users::ActivateService.call(params)
  end

  def inactivate
    authorize :users, :inactivate?

    V1::Users::InactivateService.call(params)
  end

  def destroy
    authorize :users, :destroy?

    V1::Users::DestroyService.call(params)
  end

  private

  def deny_access(error)
    render json: { message: error.message, status: 401 }
  end
end