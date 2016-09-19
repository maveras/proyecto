class AddDateEndToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :date_activity_end, :date
  end
end
