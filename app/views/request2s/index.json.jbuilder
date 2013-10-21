json.array!(@request2s) do |request2|
  json.extract! request2, :fast_id, :, :phone, :accept, :user_email, :fast_user_email,, :user_id
  json.url request2_url(request2, format: :json)
end
