ActiveAdmin.register Pichanga do
  permit_params :location_id

  index do
    selectable_column
    id_column
    column :home_team
    column :visitor_team
    column :location
    column :instructions
    column :game_date
    column :results
    column :created_at
    column :updated_at
    actions
  end

  filter :home_team
  filter :visitor_team
  filter :game_date

  form do |f|
    f.inputs do
      f.input :home_team
      f.input :visitor_team
      f.input :location
      f.input :instructions
      f.input :game_date, as: :date_time_picker
      f.input :results
    end
    f.actions
  end
end
