class CreateNewsletters < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_newsletters do |t|
      t.string :email
      t.timestamps null: false
    end
  end
end
