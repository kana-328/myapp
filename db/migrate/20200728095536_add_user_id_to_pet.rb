class AddUserIdToPet < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :user_id, :integer, foreign_key: true
  end
end
