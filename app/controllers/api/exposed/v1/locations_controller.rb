class Api::Exposed::V1::LocationsController < Api::BaseController
  def index
    respond_with filtered_collection(Location.all)
  end

  def create
    puts "CREATE"
    new_location = Location.new(location_params)
    if params[:image].present?
      new_location.image.attach(params[:image])
    end
    new_location.save!
    respond_with id: new_location.id, place_name: new_location.place_name
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
      :place_name,
      :image
    )
  end
end
