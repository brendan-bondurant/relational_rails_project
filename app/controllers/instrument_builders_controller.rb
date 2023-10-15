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

  def create
    builder = InstrumentBuilder.create(name: params[:name], year_founded: params[:year_founded], in_business: params[:in_business])
    redirect_to "/instrument_builders"
  end
end