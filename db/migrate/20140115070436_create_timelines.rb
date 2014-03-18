class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.integer :volume_id, null: false
      t.integer :card_id, null: false
      t.integer :at_time, null: false

      t.timestamps
    end
    add_index :timelines, :card_id
    add_index :timelines, :volume_id
  end
end
