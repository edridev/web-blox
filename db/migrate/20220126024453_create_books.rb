class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.date :book_date
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.string :schedule

      t.timestamps
    end
  end
end
