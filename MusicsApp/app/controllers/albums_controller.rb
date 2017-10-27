class AlbumsController < ApplicationController
  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to band_url(params[:album][:band_id])
    else
      flash.now[:error] = @album.errors.full_messages
      render band_url(params[:album][:band_id])
    end
  end

  def edit
    @album = Album.find(id: params[:id])
    render :edit
  end

  def show

  end

  def update
  end

  def destroy
    @album.find_by(id: params[:id])
  end

  private

  def album_params
    params.require(:album).permit(:band_id, :title, :year, :studio)
  end
end
