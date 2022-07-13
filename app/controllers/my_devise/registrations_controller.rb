class MyDevise::RegistrationsController < Devise::RegistrationsController
  acts_as_token_authentication_handler_for User
    def create
      user = User.create!(user_params)
      render json: user, status: :created
    end
    def cancel
      user = User.find_by(id: params[:id])
      if user
          user.destroy
          head :no_content
      else
          render json: { error: "User not found" }, status: :not_found
      end
  end
  
    private

    def user_params
        params.permit(:email, :password, :password_confirmation, :house_loc, :bio, :role, :first_name, :last_name)
    end
  
  end 