class CreateComentaries < ActiveRecord::Migration
  def change
    create_table :comentaries do |t|
      t.references :user, index: true, foreign_key: true
      t.references :request_apply, index: true, foreign_key: true
      t.text :comentary

      t.timestamps null: false
    end
  end
end
