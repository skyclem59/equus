class CreateHorses < ActiveRecord::Migration[5.1]
  def change
    create_table :horses do |t|
      t.string :name
      t.string :coat
      t.integer :age
      t.string :gender
      t.string :breed
      t.string :photo
      t.string :localisation
      t.integer :price
      t.string :category
      t.text :description
      t.float :size
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
