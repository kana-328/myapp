class ChangeDataStartToReservation < ActiveRecord::Migration[5.2]
  def change
    change_column :reservations, :start, :date
  end
end
