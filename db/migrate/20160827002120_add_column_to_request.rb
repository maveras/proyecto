class AddColumnToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :title, :text
  end
end
