class RedactorAsset < ActiveRecord::Base
	# has_attached_file :asset, styles: { original: "800x800>", thumb: "118x100>" }
  # validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/

	has_attached_file :asset,
		styles: { medium: "300x300>", thumb: "100x100>" },
		:path => ":rails_root/public/system/:class/:attachment/:id/:style.:extension",
		:url => "/system/:class/:attachment/:id/:style.:extension"

	validates_attachment :asset, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

	def file
    Paperclip.io_adapters.for(image)
  end

  def url(style = "")
    # image.path(style)
    image.url(style)
  end

end
