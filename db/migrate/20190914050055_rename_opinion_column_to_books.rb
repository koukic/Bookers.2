class RenameOpinionColumnToBooks < ActiveRecord::Migration[5.0]
  def change
    rename_column :books, :opinion, :body
  end
end
