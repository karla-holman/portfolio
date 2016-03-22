class Admin::ProjectsController < AdminController
	before_filter :set_projects

	def index
		
	end

	def create
		@project = Project.new(project_params)

		@project.save
		redirect_to @project
	end

	def edit
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
	end

	def destroy
		Project.find(params[:id]).destroy
		render :index
	end

	private

	def set_projects
		@projects = Project.all
	end

	def project_params
		params.require(:project).permit(:name, :description, :header, :thumb, :project_type)
	end
end
