class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :card_type_id
      t.string :title, null: false
      t.string :desc
      t.text :content

      t.timestamps
    end
    add_index :cards, :card_type_id
  end
end
