class AddInstrumentBuildersToModels < ActiveRecord::Migration[7.0]
  def change
    add_reference :models, :instrument_builders, null: false, foreign_key: true
  end
end
