class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :uuid,             :limit => 36
      t.string   :username,         :null => false, :default => "", :limit => 32
      t.string   :email,            :null => false, :default => "", :limit => 64
      # >>> The following fields are required and maintained by [authlogic] plugin.
      t.string   :password_hash,    :null => false, :default => ""
      t.string   :password_salt,    :null => false, :default => ""
      t.string   :remember_token,   :null => false, :default => ""
      t.string   :persistence_token,:null => false, :default => ""
      t.string   :perishable_token, :null => false, :default => ""
      t.string   :openid_identifier
      t.datetime :last_request_at
      t.datetime :last_login_at
      t.datetime :current_login_at
      t.string   :last_login_ip
      t.string   :current_login_ip
      t.integer  :login_count,      :null => false, :default => 0
      # >>> End of [authlogic] maintained fields.
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :users, [ :username, :deleted_at ], :unique => true
    add_index :users, :email
    add_index :users, :last_request_at
    add_index :users, :remember_token
    add_index :users, :perishable_token
  end
end
