class ChangeDataRecordedAtToConditions < ActiveRecord::Migration[5.2]
  def change
    change_column :conditions, :recorded_at, :string
  end
end
