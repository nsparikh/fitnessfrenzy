class Challenge < ActiveRecord::Base
	validates :title, presence: true, 
					  length: { minimum: 1, maximum: 30 },
					  format: { with: /\A[a-z0-9\s]{1,30}\z/i }
	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :units, presence: true

	has_and_belongs_to_many :users
	has_many :trackers
	has_many :messages, dependent: :destroy

	before_save do 
		self.title = title.downcase
		start_before_end
	end


	def start_before_end	
		if (self[:start_date] < self[:end_date])
			return true
		else 
			return false
		end
	end
end
