ActiveAdmin.register Location do

  index do
    selectable_column
    id_column
    column :latitude
    column :longitude
    column :place_name
    actions
  end

  form do |f|
    f.inputs do
      f.input :latitude
      f.input :longitude
      f.input :place_name
    end
    f.actions
  end
end
