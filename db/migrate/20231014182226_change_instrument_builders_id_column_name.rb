class ChangeInstrumentBuildersIdColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :models, :instrument_builders_id, :instrument_builder_id
  end
end
