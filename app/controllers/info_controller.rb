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

	def contact
		byebug
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    	redirect_to :home
    else
      flash.now[:error] = 'Cannot send message.'
      redirect_to :home
    end
  end
end
