class AddReasonForStatusChangeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :reason_for_status_change, :text
  end
end
