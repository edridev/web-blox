class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.date :data
      t.integer :hora

      t.timestamps
    end
  end
end
