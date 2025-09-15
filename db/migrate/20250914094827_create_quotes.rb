class CreateQuotes < ActiveRecord::Migration[8.0]
  def change
    create_table :quotes do |t|
      t.text :textbody, null: false
      t.integer :pubyear
      t.text :comment
      t.boolean :is_public, default: false
      t.references :user, null: false, foreign_key: true
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
