class LoginController < ActionController::Base

  layout "layouts/template"

  def login
    raise params.inspect
    if (session[:user_id].nil?)
      @user = User.new
      return render :new
    end
    @current_user = User.where(:id=>session[:user_id].to_i).first
    if(@current_user.nil?)
      redirect_to '/'
    end
      redirect_to '/admin'
  end

  def new
  end

  def create
    @user = User.where(:login => params[:user][:login]).or(User.where(:email => params[:user][:login])).first
    if( @user.nil? )
      respond_to do |format|
        format.html { redirect_to '/login', notice: 'Пароль или логин не совпадают' }
      end
    else
      if ( @user.try(:authenticate, params[:user][:password].to_s) != false )
        session[:user_id] = @user.id
        redirect_to '/admin'
      else
        respond_to do |format|
          format.html { redirect_to '/login', notice: 'Пароль или логин не совпадают' }
        end
      end
    end
  end

  def destroy
    session[:user_id]  = nil
    redirect_to '/'
  end

end