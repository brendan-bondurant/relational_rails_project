class RenameInstrumentBuilderToInstrumentBuilders < ActiveRecord::Migration[7.0]
  def change
    rename_table :instrument_builder, :instrument_builders
  end
end
