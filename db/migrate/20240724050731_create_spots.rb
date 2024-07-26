class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :content
      t.string :address, null: false
      t.float :latitude
      t.float :longitude
      t.integer :weather, null: false, default: 0

      t.timestamps
    end
  end
end
