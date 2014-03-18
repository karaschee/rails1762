class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|
      t.integer :show_id, null: false
      t.integer :no
      t.string :resource
      t.string :title, null: false
      t.string :desc
      t.text :content

      t.timestamps
    end
    add_index :volumes, :show_id
    add_index :volumes, :no
  end
end
