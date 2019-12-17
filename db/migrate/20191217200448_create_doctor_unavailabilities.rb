class CreateDoctorUnavailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :doctor_unavailabilities do |t|
    	t.datetime :start_date
    	t.datetime :end_date
    	t.integer :doctor_id

      t.timestamps
    end
  end
end
