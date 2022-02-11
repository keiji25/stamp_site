json.extract! user, :id, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :created_at, :updated_at, :student_no, :name, :point, :role_flag, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email
json.url user_url(user, format: :json)
