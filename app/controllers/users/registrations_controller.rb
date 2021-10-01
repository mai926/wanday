# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create_account]
  before_action :user_select, only: [:edit, :update, :edit_account, :update_account]
  before_action :account_select, only: [:edit_account, :update_account]
  before_action :move_to_show, only: [:edit, :update, :edit_account, :update_account]
  
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      render :new
      return
    end
    session['devise.regist_data'] = { user: @user.attributes }
    session['devise.regist_data'][:user]['password'] = params[:user][:password]

    @account = @user.build_account
    render :new_account
  end

  def create_account
    @user = User.new(session['devise.regist_data']['user'])
    @account = Account.new(account_params)
    unless @account.valid?
      render :new_account
      return
    end
    @user.build_account(@account.attributes)
    @user.save
    session['devise.regist_data']['user'].clear
    sign_in(:user, @user)
  end

  def update
    if @user.update(account_update_params)
      return redirect_to home_path(@user)
    else
      render 'edit'
    end
  end

  def update_account
    if @account.update(account_params)
      return redirect_to home_path(@user)
    else
      render 'edit_account'
    end
  end
  
  private

  def account_params
    params.require(:account).permit(:nickname, :account_id, :birthday, :introduction, :images)
  end

  def check_captcha
    @account = Account.new(account_params)
    @account.validate # Look for any other validation errors besides reCAPTCHA
    respond_with_navigational(@account) { render :new_account } unless verify_recaptcha(model: @account)
  end

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  def user_select
    @user = current_user
  end

  def account_select
    @account = @user.account
  end

  def move_to_show
    return redirect_to root_path unless @user
  end

  # def account_select
  #   @account = Account.find(params[:id])
  # end

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
