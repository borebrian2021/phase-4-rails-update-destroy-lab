class PlantsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound , with: :not_found
  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  def update
    plant=find_plant
    plant.update(is_in_stock: params[:is_in_stock])
    render json:plant
  end
  def destroy
    plant=find_plant
    plant.destroy

  end
  private
  def not_found
  render json:{error:"Plant not found"}, status: :not_found 
  end



  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end

 
  def find_plant
    Plant.find(params[:id])
  end
end
