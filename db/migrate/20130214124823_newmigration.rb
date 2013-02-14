class Newmigration < ActiveRecord::Migration
  def up
    change_column :links, :store, :text
  end

  def down
    change_column :links, :store, :string
  end
end
