class AddColumnToCondition < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :recorded_at, :integer
  end
end
