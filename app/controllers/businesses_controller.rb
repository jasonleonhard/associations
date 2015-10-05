class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find(params[:id])
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)

    if @business.save
      redirect_to businesses_path, notice: "The business has been successfully created."
    end
  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    if @business.update_attributes(business_params)
      redirect_to businesses_path, notice: "The business has been updated"
    end
  end

  def destroy
    @business = Business.find(params[:id])
    @business.destroy
    # redirect_to root_path
    redirect_to businesses_path
  end
private
  def business_params
    params.require(:business).permit!
  end
end
