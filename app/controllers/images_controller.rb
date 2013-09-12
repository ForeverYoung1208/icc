class ImagesController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => [:store]

	def store
	  image = ImageUploader.new
	  if params[:image].tempfile.size>=300.kilobytes
	  	raise "file too big! Limit is #{300.kilobytes}"
	  end
	  image.store!(params[:image])
	  render json: { upload: { links: { original: root_path+'uploads/images/'+image.file.filename } } }
	end

end
