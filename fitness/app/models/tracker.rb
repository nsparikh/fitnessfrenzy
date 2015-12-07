class Tracker < ActiveRecord::Base
	belongs_to :user
	belongs_to :challenge
	has_many :points, dependent: :destroy

	before_save do 
		self.title = title.downcase
		self.units = units.pluralize
		self.units = self.units.downcase
		if self.aux_units != nil 
			self.aux_units = aux_units.pluralize
			self.aux_units = self.aux_units.downcase
		end
		start_before_end
	end

	default_scope -> { order('updated_at DESC') }
	validates :user_id, presence: true
	validates :title, presence: true, 
					  length: { minimum: 1, maximum: 30 }, 
					  uniqueness: { :scope => :user_id, :case_sensitive => false },
					  format: { with: /\A[a-z0-9\s]{1,30}\z/i }
	# TODO: why doesn't this work? validates :goal, format: { with: /\A[0-9]*\z/ }


	def start_before_end	
		if (self[:start_date] < self[:end_date])
			return true
		else 
			return false
		end
	end

	def to_param
		title.downcase.gsub(' ', '-')
	end
end
