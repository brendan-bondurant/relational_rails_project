class ModelsController < ApplicationController
  def index
    @models = Model.all
  end
  def show
    @model = Model.find(params[:id])
  end

  def new

  end
end