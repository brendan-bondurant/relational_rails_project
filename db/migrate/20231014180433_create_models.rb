class CreateModels < ActiveRecord::Migration[7.0]
  def change
    create_table :models do |t|
      t.string :name
      t.integer :year
      t.boolean :vintage
      t.float :value

      t.timestamps
    end
  end
end
