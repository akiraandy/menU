class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :DotW, default: 0
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
