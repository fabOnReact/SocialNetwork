class AlbumsController < ApplicationController
  def index
  end

  def create
  	@album = current_user.host.albums.build(album_params)
  	authorize @album
  	if @album.save
  		# to handle multiple images upload on create
      if params[:images]
        params[:images].each { |image|
          @album.photos.create(image: image)
        }
      end
      flash[:notice] = "Your album has been created."
      redirect_to @album
    else 
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def new
  end

  def edit
  end

  def delete
  end

  private 
  def album_params
  	params.require(:album).permit(:title, :description, :photos_attributes => [:album_id, :image])
  end
end
