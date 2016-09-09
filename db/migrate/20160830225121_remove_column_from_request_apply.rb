class RemoveColumnFromRequestApply < ActiveRecord::Migration
  def change
    remove_column :request_applies, :request_apply_id, :string
  end
end
