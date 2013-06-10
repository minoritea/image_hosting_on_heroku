class AdminController < ApplicationController
  before_filter :authenticate_user!
  def index
    render :index
  end
  def root
    redirect_to '/admin'
  end
  def create
    real_type = file_type params[:image]
    if real_type then
        Image.create(
        title: params[:image].original_filename,
        image: Moped::BSON::Binary.new(:generic, open(params[:image].tempfile.path,'rb').read),
        type: real_type
      )
    else
      @error = 'Invalid file type.'
    end
    redirect_to action:'index'
  end
  
  def bitmap?(data)
    return data[0,2]=="MB"
  end

  def gif?(data)
    return data[0,4]=="GIF8"
  end

  def jpeg?(data)
    return data[0,4]=="\xff\xd8\xff\xe0"
  end

  def file_type(readable)
    data = readable.read(9)
    # magic numbers are up to 9 bytes
    return bitmap?(data) ? 'bmp' : gif?(data) ? 'gif' : jpeg?(data) ? 'jpeg' : false
  end
end
