class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.references :user,     null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :title,        null: false, default: ""
      t.string :location,     null: false, default: ""
      t.float :longitude,     null: false, default: 0.0
      t.float :latitude,      null: false, default: 0.0
      t.text :description,    null: false, default: ""
      t.boolean :main,        null: false, default: false

      t.timestamps
    end
  end
end
