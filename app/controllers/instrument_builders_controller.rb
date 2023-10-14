class InstrumentBuildersController < ApplicationController
  def index
    @instrument_builders = InstrumentBuilder.all
  end

  def show
    @instrument_builder = InstrumentBuilder.find(params[:id])
  end
end