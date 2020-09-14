class AddIndexReservationsStartEnd < ActiveRecord::Migration[5.2]
  def change
    add_index :reservations, [:start, :end]
  end
end
