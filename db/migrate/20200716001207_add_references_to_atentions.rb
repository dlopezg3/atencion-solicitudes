class AddReferencesToAtentions < ActiveRecord::Migration[6.0]
  def change
    add_reference :atentions, :business, null: false, foreign_key: true
  end
end
