class MakeLatLongNullable < ActiveRecord::Migration[5.0]
  def change
    change_column ::Charity, :latitude, :decimal, :null => true
    change_column ::Charity, :longtitude, :decimal, :null => true
  end
end
