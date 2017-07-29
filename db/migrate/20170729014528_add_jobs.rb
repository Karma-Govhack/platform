class AddJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :JobsAndSkills do |t|
      t.integer :Skill_id
      t.integer :Job_id
    end

    create_table :Job do |t|
      t.string :name
      t.string :description
      t.decimal :hours
      t.integer :amount_workers
      t.decimal :lat
      t.decimal :long
      t.belongs_to :Charity, index: true
    end

    add_foreign_key :JobsAndSkills, :Skills
    add_foreign_key :JobsAndSkills, :Job

    create_table :Charity do |t|
      t.string :name
      t.string :address
      t.belongs_to :Sector, index: true
    end

    create_table :Sector do |t|
      t.string :name
    end

    create_table :SectorAndVolunteer do |t|
      t.integer :Volunteer_id
      t.integer :Sector_id
    end

    add_foreign_key :SectorAndVolunteer, :Volunteer
    add_foreign_key :SectorAndVolunteer, :Sector
  end
end
