class Api::Exposed::V1::UsersController < Api::BaseController
  def index
    respond_with paginate(filtered_collection(User.all))
  end

  def show
    respond_with user
  end

  def create
    respond_with User.create!(user_params)
  end

  def update
    user.update!(user_params)
    respond_with user
  end

  private

  def user
    @user ||= User.find_by!(id: params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :encrypted_password,
      :reset_password_token,
      :reset_password_sent_at,
      :remember_created_at,
      :name,
      :category
    )
  end
end
