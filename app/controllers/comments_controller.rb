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