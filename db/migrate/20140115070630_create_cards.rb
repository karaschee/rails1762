class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :card_type_id
      t.string :title
      t.string :desc
      t.string :content

      t.timestamps
    end
  end
end
