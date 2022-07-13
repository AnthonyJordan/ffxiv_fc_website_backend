class MyDevise::RegistrationsController < Devise::RegistrationsController
  #  acts_as_token_authentication_handler_for User, except: :create
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
    
  def update
    byebug
    user = User.find_by(id: params[:id])
    if user
      user.update(user_params)
      render json: user
    else
      render json: { error: "user not found" }, status: :not_found
    end
   end
  
    private

    def user_params
        params.permit(:email, :password, :password_confirmation, :house_loc, :bio, :role, :first_name, :last_name, :registration, :profile_picture, :images)
    end
  
  end 