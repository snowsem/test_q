class PhotoController < ApplicationController

  before_action :authenticate_user!, :except => []

  def index
    @p = Photo.all
  end

  def create
    params.permit!
    @p = Photo.new(params[:photo])
    if @p.save
      flash[:success] = "photo added!"
      redirect_to @p
    else
      render 'new'
    end
  end

  def new
    @photo = Photo.new
  end

  def destroy
  end

  def show
  end
end
