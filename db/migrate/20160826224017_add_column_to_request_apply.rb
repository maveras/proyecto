class AddColumnToRequestApply < ActiveRecord::Migration
  def change
    add_reference :request_applies, :request, index: true, foreign_key: true
  end
end
