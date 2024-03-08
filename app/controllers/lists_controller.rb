class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    id = params[:id]
    @list = List.find(id)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_list)
    @list.save!
    redirect_to list_path(@list)
  end

  private

  def params_list
    params.require(:list).permit(:name, :photo)
  end
end
