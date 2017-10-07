class ImagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @image = Image.last.image
  end

  def create
    Image.create(params.permit(:image))
    Image.where.not(id: Image.last.id).destroy_all
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end
end
