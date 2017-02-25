class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :comments, :commentalbe_id, :commentable_id
  end
end
