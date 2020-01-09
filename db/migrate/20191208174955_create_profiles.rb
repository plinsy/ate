class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :firstname,   default: ""
      t.string :lastname,    default: ""
      t.string :gender,      default: "male"
      t.string :phone,       default: ""

      t.timestamps
    end
  end
end
