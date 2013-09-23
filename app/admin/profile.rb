ActiveAdmin.register Profile do
    show do
    	attributes_table do
      	row :image do
          image_tag(profile.photo)
        end
    		row :id
    		row :user
    		row :website
    		row :age
    		row :profession
    		row :country
    		row :about
    		row :created_at
    		row :updated_at
    	end
    end
end
