# frozen_string_literal: true

class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    V1::Users::CreateService.call(registration_params[:user])
  end

  private

  def registration_params
    params.permit(user: [:name, :email, :password, :role])
  end

  def respond_with(resource, _opts = {})
    if resource.persisted?
      @token = request.env['warden-jwt_auth.token']
      headers['Authorization'] = @token

      render json: {
        status: {
          code: 200, message: 'Signed up successfully.',
          token: @token,
          data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
        }
      }
    else
      render json: {
        status: { message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end
end
