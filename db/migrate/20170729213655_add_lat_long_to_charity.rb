class AddLatLongToCharity < ActiveRecord::Migration[5.0]
  def change
    add_column :Charity, :latitude, :decimal
    add_column :Charity, :longtitude, :decimal
  end
end
