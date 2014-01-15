class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.integer :volume_id
      t.integer :card_id
      t.integer :at_time

      t.timestamps
    end
  end
end
