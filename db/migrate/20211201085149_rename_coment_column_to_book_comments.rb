class RenameComentColumnToBookComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :book_comments, :coment, :comment
  end
end
