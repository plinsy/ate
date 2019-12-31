class AddImageToPlacesAndServices < ActiveRecord::Migration[6.0]
  def change
    add_column :places, 	:image, :string
    add_column :services, :image, :string
  end
end
