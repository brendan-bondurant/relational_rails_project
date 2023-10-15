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

  def edit
    @instrument_builder = InstrumentBuilder.find(params[:id])
  end

  def update
    instrument_builder = InstrumentBuilder.find(params[:id])
    instrument_builder.update(name: params[:name], year_founded: params[:year_founded], in_business: params[:in_business])
    redirect_to "/instrument_builders"
  end

  #use later to clean up create method by using builder_params as argument)
  def builder_params
    params.permit(:name)
    params.permit(:year_founded)
    params.permit(:in_business)
  end
end