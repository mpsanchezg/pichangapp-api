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

  def join
    if request.headers['x-user-token'].nil?
      respond_with 404
      return
    end
    if visitor_team != pichanga_to_join.home_team
      pichanga_to_join.visitor_team = visitor_team
      pichanga_to_join.save!
      respond_with pichanga_to_join
    else
      respond_with 404
    end
  end

  private

  def pichanga_to_join
    @pichanga_to_join ||= Pichanga.find_by!(id: params[:pichanga_id])
  end

  def pichanga
    @pichanga ||= Pichanga.find_by!(id: params[:id])
  end

  def visitor_team
    @visitor_team ||= User.find_by!(authentication_token: request.headers['x-user-token'])
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
