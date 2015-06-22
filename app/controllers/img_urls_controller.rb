class ImgUrlsController < ApplicationController
  before_action :set_img_url, only: [:show, :update, :destroy]

  # GET /img_urls
  # GET /img_urls.json
  def index
    @img_urls = ImgUrl.all

    render json: @img_urls
  end

  # GET /img_urls/1
  # GET /img_urls/1.json
  def show
    render json: @img_url
  end

  # POST /img_urls
  # POST /img_urls.json
  def create
    @img_url = ImgUrl.new(img_url_params)

    if @img_url.save
      render json: @img_url, status: :created, location: @img_url
    else
      render json: @img_url.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /img_urls/1
  # PATCH/PUT /img_urls/1.json
  def update
    @img_url = ImgUrl.find(params[:id])

    if @img_url.update(img_url_params)
      head :no_content
    else
      render json: @img_url.errors, status: :unprocessable_entity
    end
  end

  # DELETE /img_urls/1
  # DELETE /img_urls/1.json
  def destroy
    @img_url.destroy

    head :no_content
  end

  private

    def set_img_url
      @img_url = ImgUrl.find(params[:id])
    end

    def img_url_params
      params.require(:img_url).permit(:title)
    end
end
