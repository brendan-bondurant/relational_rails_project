class InstrumentBuilderModelsController < ApplicationController
  def index

    @instrument_builder = InstrumentBuilder.find(params[:instrument_builder_id])
    @models = @instrument_builder.models
    # require 'pry'; binding.pry
      if (params[:order] == "name")
        @models = @instrument_builder.sort
      elsif params[:value]!= nil
          worth = params[:value].to_i
        @models = @instrument_builder.value(worth)
      end
    # require 'pry'; binding.pry
  end

  def new
      @instrument_builder = InstrumentBuilder.find(params[:instrument_builder_id])
  end

  def create
    @instrument_builder = InstrumentBuilder.find_by(params[:id])
    # require 'pry'; binding.pry
    new_instrument = @instrument_builder.models.create(name: params[:name], year: params[:year], vintage: params[:vintage], value: params[:value])
    redirect_to "/instrument_builders/#{@instrument_builder.id}/models"
  end

  # def alphabetize
    # @instrument_builder = InstrumentBuilder.find_by(params[:id])
    # require 'pry'; binding.pry
  #   @models = @instrument_builder.models
  # end
end