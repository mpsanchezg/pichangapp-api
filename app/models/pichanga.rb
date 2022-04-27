class Pichanga < ApplicationRecord
  belongs_to :home_team, class_name: 'User'
  belongs_to :visitor_team, class_name: 'User', optional: true
  belongs_to :location
end

# == Schema Information
#
# Table name: pichangas
#
#  id              :bigint(8)        not null, primary key
#  home_team_id    :bigint(8)        not null
#  visitor_team_id :bigint(8)
#  location_id     :bigint(8)        not null
#  instructions    :text
#  game_date       :datetime
#  results         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_pichangas_on_home_team_id     (home_team_id)
#  index_pichangas_on_location_id      (location_id)
#  index_pichangas_on_visitor_team_id  (visitor_team_id)
#
# Foreign Keys
#
#  fk_rails_...  (home_team_id => users.id)
#  fk_rails_...  (location_id => locations.id)
#  fk_rails_...  (visitor_team_id => users.id)
#
