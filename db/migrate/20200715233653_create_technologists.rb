class CreateTechnologists < ActiveRecord::Migration[6.0]
  def change
    create_table :technologists do |t|
      t.string :name
      t.references :office, null: false, foreign_key: true

      t.timestamps
    end
  end
end
