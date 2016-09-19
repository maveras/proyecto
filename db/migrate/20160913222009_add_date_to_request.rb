class AddDateToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :date_activity, :date
  end
end
