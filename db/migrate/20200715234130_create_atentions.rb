class CreateAtentions < ActiveRecord::Migration[6.0]
  def change
    create_table :atentions do |t|
      t.integer :channel
      t.references :technologist, null: false, foreign_key: true
      t.string :cause
      t.string :subcause
      t.string :detail
      t.string :solution
      t.boolean :escalation
      t.string :escalation_responsable

      t.timestamps
    end
  end
end
