class RenameStartColumnToReservations < ActiveRecord::Migration[5.2]
  def change
    rename_column :reservations, :start, :start_date
  end
end
