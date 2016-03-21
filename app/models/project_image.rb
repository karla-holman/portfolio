class ProjectImage < ActiveRecord::Base
	has_attached_file :thumb, styles: { 
			thumb: "400x300>"
	}, default_url: "/images/:style/missing.png"
   validates_attachment_content_type :header, content_type: /\Aimage\/.*\Z/
end
