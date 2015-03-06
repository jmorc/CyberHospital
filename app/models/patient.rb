class Patient < ActiveRecord::Base
	belongs_to :clinic
	has_many :patient_datas
end
