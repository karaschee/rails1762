class Console::SessionsController < Console::ConsoleBaseController
  skip_before_filter :authorize
  
  def new
  end

  def create
    session_params = params[:session]
    staff = Staff.find_by name: session_params[:name]

    if staff and staff.authenticate(session_params[:password])
      sign_in staff
      redirect_to console_shows_url
    else
      flash.now[:error] = '用户名或密码错误' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to console_signin_url
  end

  private

    def sign_in(staff)
      session[:staff_id] = staff.id
    end

    def sign_out
      session[:staff_id] = nil
    end
end
