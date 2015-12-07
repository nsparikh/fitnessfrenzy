class ChallengesController < ApplicationController
	before_action :signed_in_user, only: [:show, :new, :edit, :create, :update, :add_user, :remove_user, :destroy]
	before_action :member_user,   only: [:show, :edit, :update, :add_user, :remove_user, :destroy]

	def show
		@tracker = current_user.trackers.find_by_challenge_id(@challenge.id)
	end

	def new
		@challenge = Challenge.new
	end

	def create
		@challenge = Challenge.new(challenge_params)
		if @challenge.save
			@challenge.users << current_user
			@new_tracker = current_user.trackers.build(:title=>@challenge.title+' challenge', 
				:start_date=>@challenge.start_date, :end_date=>@challenge.end_date,
				:units=>@challenge.units, :challenge_id=>@challenge.id, :category=>'custom')
			@new_tracker.save
			flash[:success] = "Challenge created!"
			redirect_to @challenge
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @challenge.update_attributes(challenge_params)
			flash[:success] = "Challenge updated"
			redirect_to @challenge
		else
			render 'edit'
		end
	end

	def add_user
		@other_user = User.find_by_email(add_user_params[:user_email])
		if @other_user.nil?
			flash[:error] = "Invalid user email"
			redirect_to @challenge
		elsif @challenge.users.find_by(:id => @other_user.id) != nil
			flash[:error] = "User already exists in challenge"
			redirect_to @challenge
		else
			@challenge.users << @other_user
			@new_tracker = @other_user.trackers.build(:title=>@challenge.title+' challenge', 
				:start_date=>@challenge.start_date, :end_date=>@challenge.end_date,
				:units=>@challenge.units, :challenge_id=>@challenge.id, :category=>'custom')
			@new_tracker.save
			flash[:success] = "User added!"
			redirect_to @challenge
		end
	end

	def remove_user
		current_user.trackers.find_by_challenge_id(@challenge.id).destroy
		@challenge.users.delete(current_user)
		redirect_to dashboard_path
	end

	def destroy
		@challenge.destroy
		flash[:success] = "Challenge deleted"
		redirect_to dashboard_path
	end



	private
		def challenge_params
			params.require(:challenge).permit(:title, :description, :start_date, :end_date, :units, :category)
		end

		def add_user_params
			params.permit(:user_email)
		end

		def member_user
			@challenge = Challenge.find(params[:id])
			redirect_to(dashboard_path) unless @challenge.users.include? current_user
	    end
end
