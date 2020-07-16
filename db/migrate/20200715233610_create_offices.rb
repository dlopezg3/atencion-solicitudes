class CreateOffices < ActiveRecord::Migration[6.0]
  def change
    create_table :offices do |t|
      t.string :office
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
