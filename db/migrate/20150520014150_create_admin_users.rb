class CreateAdminUsers < ActiveRecord::Migration

  def up
    create_table :admin_users do |t|
      t.string "first_name", :limit => 25
      t.string "last_name", :limit => 50
      t.string "username", :limit => 255
      t.string "email", :default => "", :null => false
      t.string "phone", :limit => 20
      t.string "createby", :limit => 255
      t.timestamps
    end

    execute "insert into admin_users (first_name, last_name, phone, username,email,createby )
                        values ('admin', 'admin', '123456', 'admin', 'admin@hotmail.com', '')"

  end

  def down
    drop_table :users
  end

end
