class Project < ActiveRecord::Base
	has_attached_file :header, styles: { 
			large: "2000x600>"
	}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :header, content_type: /\Aimage\/.*\Z/
end
