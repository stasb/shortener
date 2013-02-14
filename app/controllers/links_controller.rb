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
    @link = Link.find_by_alias(params[:alias])
    if @link.store =~ /^(http:\/\/)/
      redirect_to "#{@link.store}"
    else
      redirect_to "http://#{@link.store}"
    end
  end

end
