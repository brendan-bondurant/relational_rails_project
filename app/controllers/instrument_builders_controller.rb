class InstrumentBuildersController < ApplicationController
  def index
    @instrument_builders = InstrumentBuilder.all
  end
end