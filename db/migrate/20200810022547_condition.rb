class Condition < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :recorded_status, :string
  end
end
