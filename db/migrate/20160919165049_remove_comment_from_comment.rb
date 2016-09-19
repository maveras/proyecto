class RemoveCommentFromComment < ActiveRecord::Migration
  def change
    remove_column :comments, :comment, :string
  end
end
