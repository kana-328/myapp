class ContactMailers < ActiveRecord::Migration[5.2]
  def change
    drop_table :contact_mailers
  end
end
