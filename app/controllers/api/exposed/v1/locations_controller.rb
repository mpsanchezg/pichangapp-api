class Api::Exposed::V1::LocationsController < Api::BaseController
  def index
    respond_with filtered_collection(Location.all)
  end

  def show
    respond_with location
  end

  private

  def location
    @location ||= Location.find_by!(id: params[:id])
  end

  def location_params
    params.permit(
      :latitude,
      :longitude,
      :place_name
    )
  end
end
