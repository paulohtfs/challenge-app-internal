
class V1::Webhooks::CreateService < BaseService
  def initialize(params)
    @params = params
    @context = params[:context]
    @action = params[:action]
  end

  def call
    create_webhook
    context_class.call(params[:data])
  rescue => error
    raise error unless webhook

    webhook.update(error: error.message)
  end

  private

  attr_reader :params, :context, :action, :webhook

  def context_class
    "V1::#{context.camelize}::#{action.camelize}Service".constantize
  end

  def create_webhook
    @webhook ||= Webhook.create!(
      transaction_id: params[:transaction_id],
      context: context,
      action: action,
      params: params
    )
  end
end