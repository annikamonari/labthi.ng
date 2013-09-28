module SolutionsHelper
	def is_image_submission?
    aspect = Aspect.find(params[:aspect_id])
    if aspect.title == "Image"
    	return true
    else
    	return false
    end
	end
end
