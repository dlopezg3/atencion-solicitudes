class AddUserReferenceToAtentions < ActiveRecord::Migration[6.0]
  def change
    add_reference :atentions, :user, null: false, foreign_key: true
  end
end
