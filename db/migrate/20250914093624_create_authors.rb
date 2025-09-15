class CreateAuthors < ActiveRecord::Migration[8.0]
  def change
    create_table :authors do |t|
      t.string :auth_fname
      t.string :auth_surname
      t.integer :birthyear
      t.integer :deathyear
      t.text :biography

      t.timestamps
    end
  end
end
