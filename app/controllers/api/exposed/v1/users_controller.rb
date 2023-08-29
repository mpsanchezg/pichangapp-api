class Api::Exposed::V1::UsersController < Api::BaseController
  def index
    respond_with filtered_collection(User.all)
  end

  def show
    respond_with user
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

  def login
    _user = User.find_by_email!(params[:email])
    if _user.valid_password? params[:password]
      respond_with token: _user.authentication_token, user_id: _user.id,
        name: _user.name, category: _user.category
    else
      raise ActiveRecord::RecordNotFound
    end
  end

  def update
    user.update!(user_params)
    respond_with user
  end

  def google
    begin
      data = Google::Auth::IDTokens.verify_oidc access_token, aud: "916686299964-cn6o1hoppulj6jinlt8jqv5nllgfi6cm.apps.googleusercontent.com"
      puts "userNameData"
      puts data
      # find the user in the data
      # if the user does not exist, create a user using data
      # sign the user (based on your authentication method)
    rescue StandardError => e
    end
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
      :category
    )
  end
end
