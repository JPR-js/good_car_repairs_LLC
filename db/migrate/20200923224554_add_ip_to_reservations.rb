class AddIpToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :ip, :string
  end
end
