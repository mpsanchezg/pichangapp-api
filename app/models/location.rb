class Location < ApplicationRecord
  has_many :pichangas
  has_one_attached :image

  def image_url
    image.attached? ? Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true) : nil
  end  
end

# == Schema Information
#
# Table name: locations
#
#  id         :bigint(8)        not null, primary key
#  latitude   :string
#  longitude  :string
#  place_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
