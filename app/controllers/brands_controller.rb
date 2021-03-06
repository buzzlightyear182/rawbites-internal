class BrandsController < ApplicationController

  before_action :find_brand, only: [:show, :edit, :update, :destroy]

  def index
    @q = Brand.ransack(params[:q])
    @brands = @q.result(distinct: true)
  end

  def download
    @q = Brand.ransack(params[:q])
    @brands = @q.result(distinct: true)
    respond_to do |format|
      format.html
      format.csv { send_data @brands.to_csv }
    end
  end

  def show
  end

  def new
    @brand = Brand.new
    @companies = Company.all
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
        flash[:notice] = "#{@brand.name} has been created"
        redirect_to brands_path
    else
        flash[:error] = @brand.errors.full_messages.first
        render 'new'
    end
  end

  def edit
    @companies = Company.all
  end

  def update
    if @brand.update(brand_params)
        flash[:notice] = "#{@brand.name} has been updated"
        redirect_to brands_path
    else
        flash[:error] = @brand.errors.full_messages.first
        render 'new'
    end
  end

  def destroy
    @brand.destroy
    flash[:notice] = "Successfully deleted Brand"
    redirect_to brands_path
  end

  private
    def brand_params
      params.require(:brand).permit(:name, :company_id, :country)
    end

    def find_brand
      @brand = Brand.find(params[:id])
    end

end