class AddUrinationToCondition < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :urination, :string
  end
end
