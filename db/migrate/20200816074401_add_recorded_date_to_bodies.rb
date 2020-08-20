class AddRecordedDateToBodies < ActiveRecord::Migration[5.2]
  def change
    add_column :bodies, :recorded_date, :date
  end
end
