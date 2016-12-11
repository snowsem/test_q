class AddCounterCacheToAlbum < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :photos_count, :integer, :default => 0
    Album.find_each do |a|
      a.update_attribute(:photos_count, a.photos.length)
      a.save
      end
  end
end
