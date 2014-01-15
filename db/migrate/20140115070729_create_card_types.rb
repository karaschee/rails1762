class CreateCardTypes < ActiveRecord::Migration
  def change
    create_table :card_types do |t|
      t.string :name
      t.string :desc

      t.timestamps
    end
  end
end
