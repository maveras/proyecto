class RequestsController < ApplicationController
	before_action :set_request, only: [:show,:create_comment]

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
		@comments = Request.find(@request.id).comments
		@comment = Comment.new
	end

	
	def create_comment			
		comment = Comment.new(comment_params)
		comment.request_id = @request.id
		comment.user = current_user		
		respond_to do |format|
		  if comment.save
		    format.html { redirect_to requests_detail_path(comment), notice: 'Se creo el comentario.' }
		    format.json { render :show, status: :created, location: requests_detail_path(comment) }
		    format.js
		  else
		    format.html { render :new }
		    format.json { render json: comment.errors, status: :unprocessable_entity }
		    format.js
		  end
		end		
	end


	


	private 
		def request_params
      		params.require(:request).permit(:title, :description, :date_activity, :date_activity_end,:interest_id)
    	end
    	def set_request
	      @request = Request.find(params[:id_request])
	    end
	    def set_comment
	    	@comment = Comment.find(params[:comment])
	    end

	    def comment_params
	    	params.require(:comment).permit(:content)
	    end

end