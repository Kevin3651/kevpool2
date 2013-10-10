module ApplicationHelper
	 def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end


def options_for_time_select
    depart_time = Array.new
    for $h in 8..21 do
        for $m in ['00', '15', '30', '45'] do
            depart_time.push [$h.to_s + "h" + $m.to_s, "%02d" % $h + ":" + $m + ":00"]
        end
    end
    hour
end
end
