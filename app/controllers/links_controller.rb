class LinksController < ApplicationController

  def new
    @link = Link.new
  end

  def create
    @link = Link.shorten(params[:link])
    if @link.save
      respond_to do |format|
        format.html { redirect_to link_path(@link), :notice => "URL shortened!" }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "new" }
        format.js
      end
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def redirect
    @link = Link.find_by_alias(params[:alias])
    if @link.store =~ /^(http:\/\/)/ or @link.store =~ /^(https:\/\/)/
      redirect_to "#{@link.store}"
    else
      redirect_to "http://#{@link.store}"
    end
  end

end
