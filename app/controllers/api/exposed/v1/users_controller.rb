class Api::Exposed::V1::UsersController < Api::BaseController

  skip_before_action :authenticate_request, only: [:login, :create, :google]

  def index
    respond_with filtered_collection(User.all)
  end

  def show
    respond_with user
  end

  def current
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = jwt_decode(header)
    respond_with User.find(decoded[:user_id])
  end

  def create
    _user = User.create!(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      category: params[:category]
    )
    respond_with 201
  end

  # def login
  #   _user = User.find_by_email!(params[:email])
  #   if _user.valid_password? params[:password]
  #     respond_with token: _user.authentication_token, user_id: _user.id,
  #       name: _user.name, category: _user.category
  #   else
  #     raise ActiveRecord::RecordNotFound
  #   end
  # end

  def login
    @user = User.find_by_email(params[:email])
    if @user.valid_password? params[:password]
        token = jwt_encode(user_id: @user.id)
        respond_with token: token, user_id: @user.id,name: @user.name, category: @user.category
    else
      raise ActiveRecord::RecordNotFound
    end
  end

  def update
    user.update!(user_params)
    respond_with user
  end


  
  def google
    decoded = jwt_decode_google(params[:google_token])

    @user = User.find_by_email(decoded['email'])

    if @user
      token = jwt_encode(user_id: @user.id)
      respond_with token: token, user_id: @user.id,name: @user.name, category: @user.category
    else
      characters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a + ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')']
      password = Array.new(12) { characters.sample }.join
      @user = User.create!(
        email: decoded['email'],
        password: password,
        name: decoded["name"],
        category: "google"
      )
      token = jwt_encode(user_id: @user.id)

      respond_with token: token, user_id: @user.id,name: @user.name, category: @user.category
    end
    #respond_with token: decoded
  end

  private

  def user
    @user ||= User.find_by!(id: params[:id])
  end

  def user_params
    params.permit(
      :email,
      :password,
      :name,
      :category,
      :google_token
    )
  end
end
