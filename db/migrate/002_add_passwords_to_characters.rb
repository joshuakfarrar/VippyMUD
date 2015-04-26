class AddPasswordsToCharacters < ActiveRecord::Migration
  def up
    add_column :characters, :password, :string
  end

  def down
    remove_column :characters, :password
  end
end