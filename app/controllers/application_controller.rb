class ApplicationController < ActionController::API
	include ActionController::MimeResponds
	clear_respond_to
	respond_to :json
end
