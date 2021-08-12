class CreateBeats < ActiveRecord::Migration[6.0]
  def change
    create_table :beats do |t|
      t.string :title
      t.decimal :tempo
      t.string :scale

      t.timestamps
    end
  end
end
