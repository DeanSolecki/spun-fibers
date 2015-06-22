class ImgUrlListsController < ApplicationController
  before_action :set_img_url_list, only: [:show, :update, :destroy]

  # GET /img_url_lists
  # GET /img_url_lists.json
  def index
    @img_url_lists = ImgUrlList.all

    render json: @img_url_lists
  end

  # GET /img_url_lists/1
  # GET /img_url_lists/1.json
  def show
    render json: @img_url_list
  end

  # POST /img_url_lists
  # POST /img_url_lists.json
  def create
    @img_url_list = ImgUrlList.new(img_url_list_params)

    if @img_url_list.save
      render json: @img_url_list, status: :created, location: @img_url_list
    else
      render json: @img_url_list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /img_url_lists/1
  # PATCH/PUT /img_url_lists/1.json
  def update
    @img_url_list = ImgUrlList.find(params[:id])

    if @img_url_list.update(img_url_list_params)
      head :no_content
    else
      render json: @img_url_list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /img_url_lists/1
  # DELETE /img_url_lists/1.json
  def destroy
    @img_url_list.destroy

    head :no_content
  end

  private

    def set_img_url_list
      @img_url_list = ImgUrlList.find(params[:id])
    end

    def img_url_list_params
      params[:img_url_list]
    end
end
