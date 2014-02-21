class AddThumbnailToCards < ActiveRecord::Migration
  def change
    add_column :cards, :thumbnail, :string
  end
end
