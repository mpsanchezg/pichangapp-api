class Location < ApplicationRecord
  has_many :pichangas
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
