class Api::V1::UsersController < ApplicationController
  has_scope :by_name
  has_scope :by_role
  has_scope :by_email
  has_scope :by_whatever

  has_scope :order_name
  has_scope :order_role
  has_scope :order_email

  def index
    @users = apply_scopes(User).all
  end

  def activate
    authorize :users, :activate?

    V1::Users::ActivateService.call(params)
  rescue Pundit::NotAuthorizedError => error
    render json: { message: error.message, status: 401 }
  end

  def inactivate
    authorize :users, :inactivate?

    V1::Users::InactivateService.call(params)
  rescue Pundit::NotAuthorizedError => error
    render json: { message: error.message, status: 401 }
  end
end