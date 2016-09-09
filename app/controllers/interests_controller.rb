class InterestsController < ApplicationController
	def index
		#@user_id = params[:user_id]
		#@user_interests = UserInterest.find_by(id:@user_id)
		@user_interests = UserInterest.where(user_id: params[:user_id])
		#@interests = UserInterest.all
	end
	def show
		
	end
	def edit
		
	end
	def update
		
	end
	def destroy
		
		
	end
end
