class Project < ActiveRecord::Base
	has_attached_file :header, 
							:styles => { 
								large: "2000x600>"
							}, 
							:default_url => "/images/:style/missing.png",
							:storage => :s3,
                    	:s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :header, content_type: /\Aimage\/.*\Z/

  has_attached_file :thumb, styles: { 
			large: "400x300>"
	}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :thumb, content_type: /\Aimage\/.*\Z/


  validates_inclusion_of :project_type, :in => %w( development interaction print ), :message => "type %s is not included in the list"

  def s3_credentials
    {:bucket => "karla-portfolio", :access_key_id => ENV['AWS_ACCESS_KEY'], :secret_access_key => ENV['AWS_SECRET_KEY']}
  end
end
