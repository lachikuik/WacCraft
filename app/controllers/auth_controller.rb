class AuthController < ApplicationController
# ===================================================
# ===================== REGISTER =====================
  def register
    @user = User.new
  end

  def createUser
    @user = User.new(user_params)
    if User.exists?(email: @user.email)
      redirect_to auth_register_path, alert: "User already exists"
    elsif @user.save
      redirect_to root_path, notice: "User created successfully"
    else
      # flash.now[:alert] = "Error while creating user"
      flash.now[:alert] = @user.errors.full_messages.join(", ")
      render :register
    end
  end
# ===================================================
# ===================================================



# ===================================================
# ===================== LOGIN ========================
  def login
    @user = User.new
  end

  def verifyLogin
    @user = User.new(user_params)
    user = User.find_by(email: @user.email)
    if user && user.password == @user.password
      session[:user_id] = user.id
      redirect_to home_logged_path, notice: "Logged in successfully"
    else
      redirect_to auth_login_path, alert: "Invalid email or password"
    end
  end
# ===================================================
# ===================================================




# ===================================================
# ===================== LOGOUT =====================
  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully !"
  end
# ===================================================
# ===================================================



  def user_params
    params.require(:user).permit(:email, :password, :isAdmin)
  end

end
