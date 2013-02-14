class LinksController < ApplicationController

  def new
    @link = Link.new
  end

  def create
    @link = Link.shorten(params[:link])
    if @link.save
      redirect_to link_path(@link), :notice => "URL shortened!"
    else
      render "new"
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def redirect
    @link = Link.find(params[:alias])
    redirect_to @link.store
  end

end
