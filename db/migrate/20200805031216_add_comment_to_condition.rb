class AddCommentToCondition < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :comment, :text
  end
end
