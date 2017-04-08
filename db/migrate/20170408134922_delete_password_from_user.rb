class DeletePasswordFromUser < ActiveRecord::Migration
  remove_column :users, :password
end
