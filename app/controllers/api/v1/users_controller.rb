class Api::V1::UsersController < ApplicationController
  has_scope :by_name
  has_scope :by_role
  has_scope :by_email

  has_scope :order_name
  has_scope :order_role
  has_scope :order_email

  def index
    @users = apply_scopes(User).all
  end

  def activate
  end

  def inactivate
  end
end