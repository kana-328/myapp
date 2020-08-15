class ChangeDatatypeBirthdayOfPet < ActiveRecord::Migration[5.2]
  def change
    change_column :pets, :birthday, 'date USING CAST(birthday AS date)'
  end
end
