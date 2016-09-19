class RequestAppliesController < ApplicationController
	before_action :set_apply, only: [:revoke_apply, :accept_apply]
	before_action :set_request, only: [:new]

	def index
		@my_activities = current_user.requests.active_requests
	end

	def new 
		@apply = RequestApply.new(user:current_user,request:@request)
		if @request.state_request == 1
			@apply.save 
			redirect_to requests_detail_path, notice: "La postulacion fue enviada!."
		else
			redirect_to requests_detail_path, notice: "No se pudo postular a la actividad."
		end
	end

	
	
	def accepted_applies
		#@accepted_applies = Request
		#						.active_requests
		#						.joins(:request_applies)
		#						.where("request_applies.state = ?", RequestApply.get_active_number)
		#						.where("requests.user_id = ?", current_user.id)

	end
	
	def revoke_apply		
		#@ra = RequestApply.where(id_request: params[:id_request]).where(id_request_apply: params[:id_request_apply]).take		
		#@re = RequestApply.where(id_request_apply: params[:id_request_apply]).take		
		@apply.state = RequestApply.get_revoked_apply_number	
		@apply.save!	

		@postulante =  @apply.user.name
		if @apply.save 
			redirect_to request_applies_index_path, notice: "Rechazasaste la solicitud de #{@postulante}."
		else
			redirect_to request_applies_index_path, notice: "Ups!!! somthing wrong happened."
		end
	end

	def accept_apply		
		@apply.state = RequestApply.get_accepted_apply_number	
		@apply.save!
		@request = Request.find(@apply)
		@request.state_request = Request.get_accepted_request_number
		@request.save!

		if @request.save and @request.save 
			redirect_to request_applies_index_path notice: "La actividad fue de aceptada"
		else
			redirect_to request_applies_index_path notice: "La actividad no puedo ser aceptada"
		end		
	end



	private 
		def set_apply
			@apply = RequestApply.find(params[:id_request_apply])	 
		end

		def set_request
			@request = Request.find(params[:id_request])
		end

		


	
end