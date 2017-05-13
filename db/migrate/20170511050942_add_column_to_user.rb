class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :birthday, :date
    add_column :users, :bio, :text
    add_column :users, :place, :string
    add_column :users, :weburl, :string
  end
end
