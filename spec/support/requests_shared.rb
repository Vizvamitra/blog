module RequestHelpers
  def sign_in user = nil
    user ||= create(:user)
    post new_user_session_path, user: {email: user.email, password: user.password}
  end

  def logout
    delete destroy_user_session_path
  end
end