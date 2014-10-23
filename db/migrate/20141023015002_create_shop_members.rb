class CreateShopMembers < ActiveRecord::Migration
  def change
    create_table :shop_members do |t|
      t.string :staff_name
      t.string :staff_email
      t.string :password_hash
      t.string :password_salt
      t.string :staff_type

      t.timestamps
    end
  end
end
