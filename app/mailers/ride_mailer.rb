class RideMailer < ActionMailer::Base
  default :from => "noreply@example.com"
  def destroyed(ride)
  	@ride = ride
  	@request = ride.requests
  	mail to: @request.user_email, subject: "Your ride has been removed"
  end


end