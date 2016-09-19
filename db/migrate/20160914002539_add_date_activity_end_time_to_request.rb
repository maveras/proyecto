class AddDateActivityEndTimeToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :date_activity_end, :datetime
  end
end
