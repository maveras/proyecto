class UserInterestsController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@user_interests  = @user.interests
		@interests = Interest.all - @user_interests  

	end

	def destroy
		
		@interest = Interest.find(params[:id])
		@user = User.find(params[:user_id])

		@user_interest = UserInterest.find_by(user:@user,interest:@interest)
		@user_interest.destroy
		redirect_to user_user_interests_path(@user)

	end

	def create
		@user = User.find(params[:user_id])
		@user_interest = UserInterest.new(user_interest_params)
		@user_interest.save
		redirect_to user_user_interests_path(@user)

	end

	private

	def user_interest_params
    	params.require(:user_interest).permit(:interest_id,:user_id)
    end
end