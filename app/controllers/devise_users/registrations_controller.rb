# frozen_string_literal: true

class DeviseUsers::RegistrationsController < Devise::RegistrationsController

   # POST /resource
   def create
    student_no = params[:user][:student_no].upcase

    if !student_no.match?(/\A[K]+[0-9]{3}[A-Z]{1}[0-9]{4}\z/)
      flash[:alert] = "学籍番号の形式が正しくありません"
      redirect_to new_user_registration_path and return
    end
    mailRegex = /\A#{student_no.downcase}+@g.neec.ac.jp\z/
    email = params[:user][:email].downcase
    if !email.match?(mailRegex)
      flash[:alert] = "メールアドレスもしくは学籍番号が正しくありません"
      redirect_to new_user_registration_path and return
    end
    params[:user][:student_no] = student_no
    params[:user][:email] = email
    
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "ユーザー認証メールを送信いたしました。認証が完了しましたらログインをお願いいたします。"
      redirect_to new_user_session_path
    else
      flash[:alert] = "ユーザー登録に失敗しました。"
      render action: :new and return
    end
  end

  private
      def user_params
        params.require(:user).permit(:student_no, :email, :name, :password, :password_confirmation)
      end

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
