class CreateRequestApplies < ActiveRecord::Migration
  def change
    create_table :request_applies do |t|
      t.references :request_apply, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :state

      t.timestamps null: false
    end
  end
end
