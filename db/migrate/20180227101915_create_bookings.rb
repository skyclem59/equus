class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :date_from
      t.date :date_to
      t.text :comment
      t.boolean :status
      t.references :user, foreign_key: true
      t.references :horse, foreign_key: true

      t.timestamps
    end
  end
end
