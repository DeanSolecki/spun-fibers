class SizesController < ApplicationController
  before_action :set_size, only: [:show, :update, :destroy]

  # GET /sizes
  # GET /sizes.json
  def index
    @sizes = Size.all

    render json: @sizes
  end

  # GET /sizes/1
  # GET /sizes/1.json
  def show
    render json: @size
  end

  # POST /sizes
  # POST /sizes.json
  def create
    @size = Size.new(size_params)

    if @size.save
      render json: @size, status: :created, location: @size
    else
      render json: @size.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sizes/1
  # PATCH/PUT /sizes/1.json
  def update
    @size = Size.find(params[:id])

    if @size.update(size_params)
      head :no_content
    else
      render json: @size.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sizes/1
  # DELETE /sizes/1.json
  def destroy
    @size.destroy

    head :no_content
  end

  private

    def set_size
      @size = Size.find(params[:id])
    end

    def size_params
      params.require(:size).permit(:title)
    end
end
