
RSpec.describe V1::Webhooks::CreateService, type: :service do
  before { allow(V1::Users::CreateService).to receive(:call) }

  subject { described_class.new(params) }

  context 'when correct params' do
    let(:params) do
      {
        transaction_id: "890u34t98ht2349hg2",
        context: "users",
        action: "create",
        data: {
          name: "Webhook user",
          email: "webhoook3@email.com",
          password: "encrypt_this",
          role: "member"
        }
      }
    end

    it 'should create a webhook' do
      expect { subject.call }.to change(Webhook, :count).by(1)
    end

    it 'should call action and context class' do
      expect(V1::Users::CreateService).to receive(:call)
      subject.call
    end
  end
end
