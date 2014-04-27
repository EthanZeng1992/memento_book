class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string     :name
      t.string     :email
      t.string     :phone
      t.string     :QQ
      t.string     :address
      t.references :group, index: true

      t.timestamps
    end
  end
end
