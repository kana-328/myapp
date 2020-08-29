class RenameStartDateColumnToReservations < ActiveRecord::Migration[5.2]
  def change
    rename_column :reservations, :start_date, :start
  end
end
