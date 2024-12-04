ActiveAdmin.register Room do
  config.filters = false
  permit_params :number, :ac_type, :price, :capacity, :hotel_id, :image
  
  index do
    selectable_column
    id_column
    column :number
    column :ac_type
    column :price
    column :capacity
    column :hotel_id
    column :image
    actions 
  end

  form do |f| 
    f.inputs do 
      f.input :number
      f.input :ac_type
      f.input :price
      f.input :capacity
      f.input :hotel_id
      f.input :image, as: :file
    end
    f.actions 
  end

  show do 
    attributes_table do 
      row :number
      row :ac_type
      row :price
      row :capacity
      row :hotel_id
      row :image do |room|
        image_tag url_for(room.image) if room.image.attached?
      end
    end
  end
end
