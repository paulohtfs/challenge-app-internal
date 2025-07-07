class V1::Users::CreateService < BaseService
    def initialize(params)
        @params = params
        @name = params[:name]
        @email = params[:email]
        @password = params[:password]
        @role = params[:role]
    end

    def call
        create_user
    end

    private

    attr_reader :params, :name, :email, :password, :role

    def create_user
        user_class.create!(
            name: name,
            email: email,
            password: password
        )
    end

    def user_class
        "User::#{role.camelize}".constantize
    end
end