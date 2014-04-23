class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string     :name
      t.references :user
      t.datetime   :deleted_at

      t.timestamps
    end
  end
end
