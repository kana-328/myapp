class AddRecordedDateToConditions < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :recorded_date, :date
  end
end
