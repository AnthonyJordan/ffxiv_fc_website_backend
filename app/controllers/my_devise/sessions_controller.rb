class MyDevise::SessionsController < Devise::SessionsController
    acts_as_token_authentication_handler_for User, except: :create
    def create
        user = User.where(email: params[:email]).first
        if user&.valid_password?(params[:password])  
            render json: user, status: :created
        else
            render json: {error:"Incorrect password"}, status: :unauthorized
        end
    end

end