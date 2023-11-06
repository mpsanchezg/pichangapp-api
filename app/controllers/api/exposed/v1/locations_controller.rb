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

  def update
    @location = Location.find(params[:id])
    if params[:image].present?
      @location.image.purge if @location.image.attached?  # Remove the old image if one exists
      @location.image.attach(params[:image])  # Attach the new image
    end
    if @location.update(location_params)
      render json: { id: @location.id, place_name: @location.place_name }
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  
  def destroy
    respond_with location.destroy!
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
