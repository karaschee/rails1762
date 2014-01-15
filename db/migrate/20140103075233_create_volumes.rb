class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|
      t.integer :show_id
      t.string :resource
      t.string :title
      t.string :desc

      t.timestamps
    end
  end
end
