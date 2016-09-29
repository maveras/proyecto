class AddTimesToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :time_begin, :datetime
    add_column :requests, :time_end, :datetime
  end
end
