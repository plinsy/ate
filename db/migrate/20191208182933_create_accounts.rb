class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.references :user,   null: false, foreign_key: true
      t.string :level,      null: false, default: "Free"
      t.string :price,      null: false, default: "0 Ar/mois"
      t.datetime :deadline, null: false, default: (DateTime.now + 50.year)
      t.boolean :expired,   null: false, default: false

      t.timestamps
    end
  end
end
