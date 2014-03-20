class Console::ConsoleBaseController < ApplicationController
  layout 'console'
  
  helper_method :current_staff, :current_staff?

  before_filter :current_staff
  before_filter :authorize
  
  def current_staff
    @current_staff ||= Staff.find_by id: session[:staff_id]
  end

  def current_staff?
    !current_staff.nil?
  end

  def authorize
    if current_staff.blank?
      redirect_to console_signin_url, :notice => "请登录"
    end
  end
end
