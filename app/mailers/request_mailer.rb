class RequestMailer < ActionMailer::Base
  default :from => "noreply@kevpool.com"
  def request_created(request)
  	@request = request
  	mail to: @request.user_email, subject: "thanks"
  end

  def accept_reject(request)
  	@request = request
  	mail to: @request.ride_user_email, subject: "Accept or Reject"
  end

  def accepted(request)
  	@request = request
  	mail to: @request.user_email, subject: "Your request has been accepted"
  end

  def rejected(request)
  	@request = request
  	mail to: @request.user_email, subject: "Your request has been dismissed" 
  end

  def destroyed(request)
  	@request = request
  	mail to: @request.user_email, subject: "Your ride has been removed"
  end

end
