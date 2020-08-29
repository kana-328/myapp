class RenameEndDateColumnToReservations < ActiveRecord::Migration[5.2]
  def change
    rename_column :reservations, :end_date, :end
  end
end
