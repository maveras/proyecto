class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :user, index: true, foreign_key: true
      t.references :interest, index: true, foreign_key: true
      t.text :description
      t.datetime :day_time
      t.integer :state_request
      t.string :location
      t.datetime :date_end

      t.timestamps null: false
    end
  end
end
