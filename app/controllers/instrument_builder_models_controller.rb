class InstrumentBuilderModelsController < ApplicationController
  def index
    @instrument_builder = InstrumentBuilder.find(params[:instrument_builder_id])
    @models = @instrument_builder.models
  end

  def new
    
  end
end