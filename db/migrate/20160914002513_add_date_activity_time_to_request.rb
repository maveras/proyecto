class AddDateActivityTimeToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :date_activity, :datetime
  end
end
