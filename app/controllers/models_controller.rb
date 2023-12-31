class ModelsController < ApplicationController
  def index
    @models = Model.all
  end
  
  def show
    @model = Model.find(params[:id])
  end

  def edit
    @model = Model.find(params[:id])
  end

  def update
    model = Model.find(params[:id])
    model.update(name: params[:name], year: params[:year], vintage: params[:vintage], value: params[:value])
    redirect_to "/models/#{model.id}"
  end

  def destroy
    model = Model.find(params[:id])
    model.destroy
    redirect_to "/models"
  end

end