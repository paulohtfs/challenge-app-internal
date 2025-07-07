require 'rails_helper'

RSpec.describe V1::Users::CreateService, type: :service do
  context 'create admin user' do
    let(:service) { described_class }
    let(:params) do
      {
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        role: 'admin'
      }
    end

    subject { service.new(params) }

    it 'should create admin user' do
      expect { subject.call }.to change(User, :count).by(1)
    end

    it 'persist user on database (alternative)' do
      expect(subject.call.persisted?).to be(true) 
    end

    it 'create admin with params' do
      expect(subject.call).to have_attributes(
        name: params[:name],
        email: params[:email],
        role: 'User::Admin'
      )
    end
  end

  context 'create admin member' do
    let(:service) { described_class }
    let(:params) do
      {
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        role: 'member'
      }
    end

    subject { service.new(params) }

    it 'should create member user' do
      expect { subject.call }.to change(User, :count).by(1)
    end

    it 'persist user on database (alternative)' do
      expect(subject.call.persisted?).to be(true) 
    end

    it 'create member with params' do
      expect(subject.call).to have_attributes(
        name: params[:name],
        email: params[:email],
        role: 'User::Member'
      )
    end
  end

  context 'when wrong role' do
    let(:service) { described_class }
    let(:params) do
      {
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        role: 'unexisted'
      }
    end

    subject { service.new(params) }

    it 'should raise NameError' do
      expect { subject.call }.to raise_error(NameError) 
    end
  end
end
