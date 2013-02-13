class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :store
      t.string :alias

      t.timestamps
    end
  end
end
