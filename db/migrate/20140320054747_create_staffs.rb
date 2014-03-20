class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
