class Api::Exposed::V1::PichangasController < Api::BaseController
  def index
    respond_with paginate(filtered_collection(Pichanga.all))
  end

  def show
    respond_with pichanga
  end

  def create
    respond_with Pichanga.create!(pichanga_params)
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
    params.require(:pichanga).permit(
      :home_team_id,
      :visitor_team_id,
      :location_id,
      :instructions,
      :game_date,
      :results
    )
  end
end
