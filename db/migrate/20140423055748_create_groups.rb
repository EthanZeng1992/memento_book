class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string     :name
      t.references :school
      t.datetime   :deleted_at

      t.timestamps
    end
  end
end
