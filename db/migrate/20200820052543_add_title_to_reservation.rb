class AddTitleToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :Title, :string
  end
end
