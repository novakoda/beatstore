class CreateLicenses < ActiveRecord::Migration[6.0]
  def change
    create_table :licenses do |t|
      t.string :name
      t.text :info
      t.decimal :price, precision: 10, scale: 2
      t.boolean :has_wav
      t.boolean :has_trackouts
      t.references :beat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
