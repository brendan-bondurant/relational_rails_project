class InstrumentBuildersController < ApplicationController
  def index
    @instrument_builders = InstrumentBuilder.all
  end

  def show
    # require 'pry'; binding.pry
    @instrument_builder = InstrumentBuilder.find(params[:id])
  end

  def new
    
  end
end