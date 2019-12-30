class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.references :place,    null: false, foreign_key: true
      t.string :title,        null: false, default: ""
      t.references :category, null: false, foreign_key: true
      t.text :description,    null: false, default: ""
      t.float :price,         null: false, default: 0

      t.timestamps
    end
  end
end
