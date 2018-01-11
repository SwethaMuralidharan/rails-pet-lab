class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.string :veterinarian
      t.string :reason
      t.datetime :time
      t.references :pet, foreign_key: true

      t.timestamps
    end
  end
end
