class Admin::ProjectImagesController < ApplicationController
	before_filter :get_images

	def index
	end

	def new
		@image = ProjectImage.new
	end

	def create
		@image = @project.project_images.create(project_image_params)
		if @image.save
			flash[:success] = "Image successfully created"
			render :index
		else
			errors = @image.errors
			flash[:error] = "Image not created: " + errors
			render :index
		end
	end

	private

	def get_images
		@images = ProjectImage.where("project_id=?", params[:project_id])
		@project = Project.find(params[:project_id])
	end

	def project_image_params
		params.require(:project_image).permit(:name, :description, :attachment)
	end

end
