class RenameLongToLongtitude < ActiveRecord::Migration[5.0]
  def change
    rename_column :Job, :lat, :latitude
    rename_column :Job, :long, :longtitude
    rename_column :Volunteer, :lat, :latitude
    rename_column :Volunteer, :long, :longtitude
  end
end
