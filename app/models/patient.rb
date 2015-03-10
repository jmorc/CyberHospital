class Patient < ActiveRecord::Base
	belongs_to :clinic
	has_many :patient_datas

	def viewable?
		Time.now > self.viewable_time.to_time && (cannot? :update, @patient) 
	end
end
