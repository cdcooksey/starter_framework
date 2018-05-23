class ApplicationController < ActionController::API
	include FastJsonApiResponse
	include ExceptionHandler
end
