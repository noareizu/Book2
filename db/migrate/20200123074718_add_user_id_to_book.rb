class AddUserIdToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :userId, :string
  end
end
