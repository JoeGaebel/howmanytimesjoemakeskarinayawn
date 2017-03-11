class CreateYawns < ActiveRecord::Migration[5.0]
  def change
    create_table :yawns do |t|
      t.boolean :is_joe
      t.timestamps
    end
  end
end
