class RemoveUserIdFromBook < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :userId, :string
  end
end
