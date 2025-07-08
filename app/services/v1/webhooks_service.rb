class V1::WebhooksService < BaseService
  def initialize(params)
    @params = params
    @action = params[:action]
  end

  def call
    validate
    webhook_class.call(params)
  end

  private

  attr_reader :params, :action

  def validate
    [:context, :action].each do |key|
        raise 'Missing key' unless params.has_key?(key)
    end
  end

  def webhook_class
    "::V1::Webhooks::#{action.camelize}Service".constantize
  end
end