class RenameTitleColumnToReservations < ActiveRecord::Migration[5.2]
  def change
    rename_column :reservations, :Title, :title
  end
end
