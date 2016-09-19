class RemoveDateActivityFromRequest < ActiveRecord::Migration
  def change
    remove_column :requests, :date_activity, :date
    remove_column :requests, :date_activity_end, :date
  end
end
