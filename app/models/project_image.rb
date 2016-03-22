class ProjectImage < ActiveRecord::Base
		belongs_to :project
		
		has_attached_file :attachment,
                  styles: { 
                  	large: "1000x500>"
                  },
                  default_style: :large,
                  url: '/projects/:id/:style/:basename.:extension',
                  convert_options: { all: '-strip -auto-orient -colorspace sRGB' },
                  :storage => :s3,
                  :s3_credentials => Rails.root.join("config/aws.yml")
    validates_attachment :attachment,
      :presence => true,
      :content_type => { :content_type => %w(image/jpeg image/jpg image/png image/gif) }
end
