class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.string :f_name
      t.string :l_name
      t.integer :phone_num
      t.integer :year
      t.string :make
      t.string :model
      t.string :repair
      t.datetime :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
