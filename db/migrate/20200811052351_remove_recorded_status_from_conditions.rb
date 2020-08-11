class RemoveRecordedStatusFromConditions < ActiveRecord::Migration[5.2]
  def change
    remove_column :conditions, :recorded_status, :string
  end
end
