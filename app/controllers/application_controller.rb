class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :initialize_fast

  def initialize_fast
    @fast = Fast.new
  end


def after_sign_in_path_for(resource)
  session[:previous_url] || user_path(current_user.id)
end

private

def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end
helper_method :mobile_device?

end