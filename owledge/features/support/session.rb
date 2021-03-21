include Warden::Test::Helpers

module SessionHelpers
  def login(user)
    @current_user = User.find_by_email(user)
    login_as user
    if @current_user.nil?
      raise "Bad."
    end
  end

  def current_user
    @current_user
  end
  def logout
    sign_out @current_user
  end
end

World(SessionHelpers)