class CreateContacts < SpreeExtension::Migration
  def change
    create_table :spree_contacts  do |t|
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :phone
			t.string :message
      t.timestamps null: false
    end
  end
end
