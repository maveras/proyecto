class RemoveDateEndFromRequests < ActiveRecord::Migration
  def change
    remove_column :requests, :date_end, :string
  end
end
