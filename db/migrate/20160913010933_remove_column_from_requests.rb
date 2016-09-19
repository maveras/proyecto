class RemoveColumnFromRequests < ActiveRecord::Migration
  def change
    remove_column :requests, :day_time, :string
  end
end
