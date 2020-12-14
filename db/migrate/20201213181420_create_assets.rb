class CreateAssets < ActiveRecord::Migration[6.0]
  def change
    create_table :assets do |t|
      t.integer :owner_id
      t.string :name

      t.timestamps
    end
  end
end
