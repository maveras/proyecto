class RequestsController < ApplicationController
	before_action :set_request, only: [:show]

	def index
		# Todos los requests exxcepto los del usuario
		#asociados a sus intereses
		@requests = Request.all_includes_user
		
		#@interesting_user_requests = Request.all
		#	.where.not(user_id: current_user.id)
		#	.joins(:interest)
		#	.where(interest_id: 	
		#		current_user.interests.pluck("interests.id")
		#	)
		@interesting_user_requests = Request.all_interesting_request(current_user)	
		#render json:@requests.to_json

		#current_user_interest_ids = current_user.interests.pluck(:id)
		#@user_to_do_requests = Request.where(id: current_user_interest_ids)
		#@interesting_request_count = @interesting_user_requests.count
		@other_requests = @requests - @interesting_user_requests
		#render json:@other_requests.to_json
		#byebug
	end

	def new
		user_interest = current_user.interests
		interests = Interest.all - user_interest
		@interest_by_importance = user_interest + interests
		@request = Request.new
	end	

	def create

		request = Request.new(request_params)
		request.user = current_user
		#byebug
		#date_activity_date = request.date_activity.to_date
		#date_activity_hour = request.date_activity
		if request.save
			redirect_to request_applies_index_path
		else
		end
		#byebug				
	end
	def show
		@estado_boton_postulacion = current_user.request_applies.where(request:@request).any?
		@total_postulaciones = @request.request_applies.count	
		@comments = Comment.joins(:request).where("requests.id = ?", @request.id)
		@comment = Comment.new		
	end
	

	private 
		def request_params
      		params.require(:request).permit(:title, :description, :date_activity, :date_activity_end,:interest_id)
    	end
    	def set_request
	      @request = Request.find(params[:id_request])
	    end	    
end