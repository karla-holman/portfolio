class Project < ActiveRecord::Base

	has_many :project_images
	
	has_attached_file :thumb,
                  styles: { 
                  	thumb: "400x300>"
                  },
                  default_style: :thumb,
                  url: '/projects/:id/:style/:basename.:extension',
                  convert_options: { all: '-strip -auto-orient -colorspace sRGB' },
                  :storage => :s3,
                  :s3_credentials => Rails.root.join("config/aws.yml")
    validates_attachment :thumb,
      :presence => true,
      :content_type => { :content_type => %w(image/jpeg image/jpg image/png image/gif) }

	has_attached_file :header,
                  styles: {
                    
                      large: "2000x600>"
                    
                  },
                  default_style: :large,
                  url: '/projects/:id/:style/:basename.:extension',
                  convert_options: { all: '-strip -auto-orient -colorspace sRGB' },
                  :storage => :s3,
                  :s3_credentials => Rails.root.join("config/aws.yml")
    validates_attachment :header,
      :presence => true,
      :content_type => { :content_type => %w(image/jpeg image/jpg image/png image/gif) }


  validates_inclusion_of :project_type, :in => %w( development interaction print ), :message => "type %s is not included in the list"

end
