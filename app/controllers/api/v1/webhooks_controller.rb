class Api::V1::WebhooksController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    V1::WebhooksService.call(params)
  end
end