class TrackersController < ApplicationController
	before_action :signed_in_user, only: [:show, :create, :update, :destroy]
	before_action :correct_user, only: [:show, :update, :destroy]

	def show 
		@user = current_user
	end

	def create
		@tracker = current_user.trackers.build(tracker_params)
		if @tracker.save
			flash[:success] = "Tracker created"
		else
			flash[:error] = "Couldn't create tracker. Make sure title is unique and all required fields are entered properly."
		end
		redirect_to dashboard_path
	end

	def update
		@point = @tracker.points.build(point_params)
		@point.save
		redirect_to :back
	end

	def destroy
		@tracker.destroy
		redirect_to dashboard_path
	end

	private
		def tracker_params
			params.require(:tracker).permit(:title, :start_date, 
				:end_date, :units, :goal, :aux_units, :aux_goal, :category, :challenge_id)
		end

		def from_param(param)
			param.gsub('-', ' ')
		end

		def point_params
			params.permit(:data, :aux_data, :created_at)
		end

		def correct_user
			@tracker = current_user.trackers.find_by_title!(from_param(params[:id]))
			redirect_to dashboard_path if @tracker.nil?
		end
end