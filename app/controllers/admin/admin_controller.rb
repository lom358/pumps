class Admin::AdminController < ActionController::Base
  layout "admin/layouts/application"

  before_filter :check_user

  def check_user
    session[:user_id] ||= 0
    @user = User.where(:id=>session[:user_id].to_i).first
    return redirect_to '/login' unless @user
  end

end