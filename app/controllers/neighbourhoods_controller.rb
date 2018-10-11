class NeighbourhoodsController < ApplicationController
  def index
    @neighbours = Neighbourhood.all
  end

  def show
    @neighbourhood = Neighbourhood.find(params[:id])
  end

  def destroy

  end
end
