class CategoriesController < ApplicationController
  before_action :set_category, only: [:update, :destroy]
  respond_to :json, only: [:create, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = current_user.categories.filter_conditions(params[:name])
  end

  # POST /categories.json
  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      render :show, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1.json
  def update
    if @category.update(category_params)
      render :show, status: :ok, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1.json
  def destroy
    @category.destroy
    render nothing: true, status: :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = current_user.categories.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.permit(:name)
  end
end
