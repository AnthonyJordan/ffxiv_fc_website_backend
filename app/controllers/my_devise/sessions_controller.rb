class MyDevise::SessionsController < Devise::SessionsController
    def create
        user = User.where(email: params[:email]).first
        if user&.valid_password?(params[:password])  
            render json: user, status: :created
        else
            render json: {error:"Incorrect password"}, status: :unauthorized
        end
    end
end