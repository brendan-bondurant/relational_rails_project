class RenameInstrumentBuildersToInstrumentBuilder < ActiveRecord::Migration[7.0]
  def change
    rename_table :instrument_builders, :instrument_builder
  
  end
end
