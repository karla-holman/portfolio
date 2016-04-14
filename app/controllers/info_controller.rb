class InfoController < ApplicationController
	def home
		@current = "home"
		@contact = Contact.new
	end

	def about
		@current = "about"
	end

	def work
		@current = "work"
		@projects = Project.all
	end
end
