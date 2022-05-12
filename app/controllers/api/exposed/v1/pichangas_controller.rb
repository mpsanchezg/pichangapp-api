class Api::Exposed::V1::PichangasController < Api::BaseController
  acts_as_token_authentication_handler_for User, only: [:create, :update, :destroy]

  def index
    respond_with filtered_collection(Pichanga.all)
  end

  def show
    respond_with pichanga
  end

  def create
    new_pichanga = Pichanga.new(pichanga_params)
    respond_with new_pichanga.save!
  end

  def update
    pichanga.update!(pichanga_params)
    respond_with pichanga
  end

  def destroy
    respond_with pichanga.destroy!
  end

  private

  def pichanga
    @pichanga ||= Pichanga.find_by!(id: params[:id])
  end

  def pichanga_params
    params.permit(
      :home_team_id,
      :visitor_team_id,
      :location_id,
      :instructions,
      :game_date,
      :results
    )
  end
end
