class RemoveNullConstraintFromHandIdOnCard < ActiveRecord::Migration[8.0]
  def change
    change_column_null :cards, :hand_id, true
  end
end
