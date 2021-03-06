class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :doctor_patients
	has_many :doctors, through: :doctor_patients
	has_many :appointments, through: :doctor_patients
end
