class AddDefecationToCondition < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :defecation, :string
  end
end
