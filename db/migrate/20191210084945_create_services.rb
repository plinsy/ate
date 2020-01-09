class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.references :place,    null: false, foreign_key: true
      t.string :title,        null: false
      t.text :description,    null: false
      t.float :price,         null: false
      t.datetime :date,				null: false
      t.boolean :repeat,			null: false, default: false
      t.datetime :repeat_time

      t.timestamps
    end
  end
end
