class CreateThumbImages < ActiveRecord::Migration
  def change
    create_table :thumb_images do |t|
      t.string :asset
      t.integer :thumb_imageable_id, null: false
      t.string :thumb_imageable_type, null: false

      t.timestamps
    end
    add_index :thumb_images, [:thumb_imageable_id, :thumb_imageable_type], name: 'by_imageable'
  end
end
