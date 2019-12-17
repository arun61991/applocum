class DoctorPatient < ActiveRecord::Base
	belongs_to :doctor
	belongs_to :patient
	has_many :appointments
end