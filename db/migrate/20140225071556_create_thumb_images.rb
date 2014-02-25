class CreateThumbImages < ActiveRecord::Migration
  def change
    create_table :thumb_images do |t|
      t.string :asset
      t.integer :thumb_imageable_id
      t.string :thumb_imageable_type

      t.timestamps
    end
  end
end
