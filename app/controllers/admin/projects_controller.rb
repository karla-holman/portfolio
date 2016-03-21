class Admin::ProjectsController < AdminController
	def index
		@projects = Project.all
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

	private

	def project_params
		params.require(:project).permit(:name, :description, :header, :thumb, :project_type)
	end
end
