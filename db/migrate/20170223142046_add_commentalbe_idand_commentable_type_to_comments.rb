class AddCommentalbeIdandCommentableTypeToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commentalbe_id, :integer
    add_column :comments, :commentable_type, :string
  end
end
