class AddPolesToImages < ActiveRecord::Migration
  def change
    add_column :images, :imageable_type, :string
    add_column :images, :imageable_id, :integer
    add_column :images, :user_id, :integer
  end
end
