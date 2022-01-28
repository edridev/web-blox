class CreateTetetetes < ActiveRecord::Migration[5.2]
  def change
    create_table :tetetetes do |t|
      t.string :name
      t.string :full_name
      t.string :address
      t.string :number
      t.string :district
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
