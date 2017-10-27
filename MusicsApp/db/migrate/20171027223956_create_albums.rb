class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.integer :band_id, unique: true, null: false
      t.string :title
      t.string :year
      t.boolean :studio, default: true
      t.timestamps
    end

    add_index :albums, :band_id
  end
end
