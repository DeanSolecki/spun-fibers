class SizeListsController < ApplicationController
  before_action :set_size_list, only: [:show, :update, :destroy]

  # GET /size_lists
  # GET /size_lists.json
  def index
    @size_lists = SizeList.all

    render json: @size_lists
  end

  # GET /size_lists/1
  # GET /size_lists/1.json
  def show
    render json: @size_list
  end

  # POST /size_lists
  # POST /size_lists.json
  def create
    @size_list = SizeList.new(size_list_params)

    if @size_list.save
      render json: @size_list, status: :created, location: @size_list
    else
      render json: @size_list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /size_lists/1
  # PATCH/PUT /size_lists/1.json
  def update
    @size_list = SizeList.find(params[:id])

    if @size_list.update(size_list_params)
      head :no_content
    else
      render json: @size_list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /size_lists/1
  # DELETE /size_lists/1.json
  def destroy
    @size_list.destroy

    head :no_content
  end

  private

    def set_size_list
      @size_list = SizeList.find(params[:id])
    end

    def size_list_params
      params[:size_list]
    end
end
