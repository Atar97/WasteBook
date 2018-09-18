json.extract! user, :id, :email, :phone, :password_digest, :fname, :lname, :session_token, :dob, :admin, :gender, :created_at, :updated_at
json.url user_url(user, format: :json)
