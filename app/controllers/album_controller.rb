class AlbumController < ApplicationController

  before_action :set_album, only: [:show, :edit, :update, :delete_photo]
  before_action :authenticate_user!, :except => []

  def index
    @a = current_user.albums.all
  end

  def new
    @a = Album.new
  end

  def create
    params.permit!
    @a = Album.new(params[:album])
    @a.user = current_user

    if @a.save
      flash[:success] = "album added!"
      redirect_to @a
    else
      render 'new'
    end
  end

  def add
    params.permit!
    @p = Photo.new(params[:photo])
    @p.album_id = params[:id]
    if @p.save
      flash[:success] = "photo added!"
      redirect_to album_path(params[:id])
    else
      render 'edit'
    end

  end

  def show
  end

  def edit
    @photo = Photo.new
  end

  def update
    params.permit!

    if @album.update(params[:album])
      redirect_to @album, notice: 'Album was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
  end

  def delete_photo
    Photo.find(params[:photo_id]).destroy
    redirect_to edit_album_path(params[:id]), notice: 'photo was successfully destroyed.'
  end

  def set_album
    @album = Album.find(params[:id])
  end

end
