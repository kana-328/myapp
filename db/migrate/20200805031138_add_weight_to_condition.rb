class AddWeightToCondition < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :weight, :float
  end
end
