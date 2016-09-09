class RequestsController < ApplicationController
	def index
		# Todos los requests exxcepto los del usuario
		#asociados a sus intereses
		@requests = Request.all
		@interesting_user_requests = Request.all
			.where.not(user_id: current_user.id)
			.joins(:interest)
			.where(interest_id: 	
				current_user.interests.pluck("interests.id")
			)
		#render json:@requests.to_json

		#current_user_interest_ids = current_user.interests.pluck(:id)
		#@user_to_do_requests = Request.where(id: current_user_interest_ids)

		@other_requests = @requests - @interesting_user_requests
		#render json:@other_requests.to_json
		#byebug
	end
end