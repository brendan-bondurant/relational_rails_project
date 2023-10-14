class CreateInstrumentBuilders < ActiveRecord::Migration[7.0]
  def change
    create_table :instrument_builders do |t|
      t.string :name
      t.integer :year_founded
      t.boolean :in_business

      t.timestamps
    end
  end
end
