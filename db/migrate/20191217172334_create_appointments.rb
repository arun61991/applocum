class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :status, default: 'pending'
      t.datetime :appointment_date
      t.integer :doctor_patient_id

      t.timestamps null: false
    end
  end
end
