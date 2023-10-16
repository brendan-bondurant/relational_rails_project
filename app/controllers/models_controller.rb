class ModelsController < ApplicationController
  def index
    @models = Model.all
  end
  def show
    @model = Model.find(params[:id])
  end

  def create
    # @new = Model.create!(name: params[:name], year: params[:year], vintage: params[:vintage], value: params[:value])
  end

  def edit
    
  end

end