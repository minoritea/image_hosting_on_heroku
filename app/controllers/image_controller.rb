class ImageController < ApplicationController
  def show
    image = Image.where(id: params[:id]).first
    if image then
      response.headers['Cache-Control'] = "public, max-age=#{12.hours.to_i}"
      response.headers['Content-Type'] = "image/#{image.type}"
      response.headers['Content-Disposition'] = 'inline'
      img = Moped::BSON::Binary.new(:generic,open(File.dirname(__FILE__) + '/../../spec/static_files/test.jpg','rb').read).data
      render text: img
    else
      render :text => 'hogehoge'
    end
  end
end
