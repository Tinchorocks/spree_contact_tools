class CreateNewsletters < SpreeExtension::Migration
  def change
    create_table :spree_newsletters do |t|
      t.string :email
      t.timestamps null: false
    end
  end
end
