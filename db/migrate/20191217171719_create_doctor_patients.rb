class CreateDoctorPatients < ActiveRecord::Migration[5.0]
  def change
    create_table :doctor_patients do |t|
      t.integer :patient_id
      t.integer :doctor_id

      t.timestamps null: false
    end
  end
end
