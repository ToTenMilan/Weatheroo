class Authentication
  def initialize(params)
    @params = params
  end

  def user
    user = User.find_by(email: @params[:email])
    user if user && user.authenticate(@params[:password])
  end

  def authenticated?
    user.present?
  end
end