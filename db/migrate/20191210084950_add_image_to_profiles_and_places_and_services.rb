class AddImageToProfilesAndPlacesAndServices < ActiveRecord::Migration[6.0]
  def change
  	add_column :profiles, :avatar, :string
    add_column :places, 	:image,  :string
    add_column :services, :image,  :string
  end
end
