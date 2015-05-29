class ContainerController < ApplicationController
  def show
    @container = Container.find(params[:id])
  end
end
