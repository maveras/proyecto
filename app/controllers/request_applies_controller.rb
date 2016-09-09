class RequestAppliesController < ApplicationController
	before_action :set_apply, only: [:rechazo_apply, :accept_apply]

	def index
		@my_activities = current_user.activities
	end	
	
	def accepted_applies
		#@accepted_applies = Request
		#						.active_requests
		#						.joins(:request_applies)
		#						.where("request_applies.state = ?", RequestApply.get_active_number)
		#						.where("requests.user_id = ?", current_user.id)
		@accepted_applies = RequestApply
									.all
									.joins(:request)
									.apply_accepted
									.where("requests.state_request = ?",1)
	end

	def cancel_apply

	end



	def rechazo_apply		
		#@ra = RequestApply.where(id_request: params[:id_request]).where(id_request_apply: params[:id_request_apply]).take		
		#@re = RequestApply.where(id_request_apply: params[:id_request_apply]).take		
		@apply.state = 0	
		@apply.save!	

		@postulante =  @apply.user.name
		if @apply.save 
			redirect_to request_applies_index_path, notice: "Rechazasaste la solicitud de #{@postulante}."
		else
			redirect_to request_applies_index_path, notice: "Ups!!! somthing wrong happened."
		end
	end

	def accept_apply		
		@apply.state = 2	
		@apply.save!	
		redirect_to request_applies_index_path
	end

	private 
		def set_apply
			@apply = RequestApply.find(params[:id_request_apply])	 
		end

end