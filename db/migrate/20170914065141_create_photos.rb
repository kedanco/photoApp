class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|

      t.string      :caption
      t.string      :image

      t.timestamps

      t.references :album, foreign_key: true
    end
  end
end
