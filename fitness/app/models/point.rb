class Point < ActiveRecord::Base
	belongs_to :tracker
	default_scope -> { order ('created_at') }
	
	validates :tracker_id, presence: true
	validates :data, presence: true
end
