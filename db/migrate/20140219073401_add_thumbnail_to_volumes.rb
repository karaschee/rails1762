class AddThumbnailToVolumes < ActiveRecord::Migration
  def change
    add_column :volumes, :thumbnail, :string
  end
end
