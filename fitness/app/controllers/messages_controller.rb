class MessagesController < ApplicationController
	def create
		@challenge = Challenge.find(params[:challenge_id])
		@message = @challenge.messages.create(params[:message].permit(:body).merge(:user_id => current_user.id))
		redirect_to challenge_path(@challenge)
	end

	def destroy
		@challenge = Challenge.find(params[:challenge_id])
		@message = @challenge.messages.find(params[:id])
		@message.destroy
		redirect_to challenge_path(@challenge)
	end
end
