class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.integer :count, null: false, default: 1
      t.integer :tagable_id
      t.string :tagable_type

      t.timestamps
    end
    add_index :tags, [:tagable_id, :tagable_type]
  end
end
