class ChangeDataEndToReservation < ActiveRecord::Migration[5.2]
  def change
    change_column :reservations, :end, :date
  end
end
