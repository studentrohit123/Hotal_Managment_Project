ActiveAdmin.register Hotel do
  config.filters = false
  permit_params :name, :address, :number, :description, :rating, :image
  
  index do
    selectable_column
    id_column
    column :name
    column :address 
    column :number
    column :description 
    column :rating 
    column :image
    actions 
  end

  form do |f| 
    f.inputs do 
      f.input :name 
      f.input :address 
      f.input :number
      f.input :description 
      f.input :rating 
      f.input :image, as: :file
    end
    f.actions 
  end

  show do 
    attributes_table do 
      row :name 
      row :address 
      row :number 
      row :description 
      row :rating 
      row :image do |hotel|
        image_tag url_for(hotel.image) if hotel.image.attached?
      end
    end
  end
end
   
