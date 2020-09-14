class AddIndexUsersFirstnameLastnameTel < ActiveRecord::Migration[5.2]
  def change
    add_index :users, [:firstname, :lastname, :tel]
  end
end
