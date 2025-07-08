
require 'rails_helper'

RSpec.describe V1::WebhooksService, type: :service do
  before { allow(V1::Webhooks::CreateService).to receive(:call) }

  subject { described_class.new(params) }

  context 'when correct params' do
    let(:params) do
      {
        transaction_id: "890u34t98ht2349hg2",
        context: "users",
        action: "create",
        data: {
          name: "Webhook user",
          email: "webhoook2@email.com",
          password: "encrypt_this",
          role: "member"
        }
      }
    end

    before { subject.call }

    it 'should redirect to correct action webhook' do
      expect(V1::Webhooks::CreateService).to have_received(:call)
    end
  end

  context 'when missing params' do
    let(:params) do
      {
        transaction_id: "890u34t98ht2349hg2",
        action: "create",
        data: {
          name: "Webhook user",
          email: "webhoook2@email.com",
          password: "encrypt_this",
          role: "member"
        }
      }
    end

    it 'should raise error' do
      expect { subject.call }.to raise_error('Missing key')
    end
  end
end