class ProductRequestsController < ApplicationController
  def show
    @product_request = ProductRequest.find(params[:id])

    if FetchOffers.new(@product_request).call
      @offers = @product_request.offers
    end
  end

  def new
    @product_request = ProductRequest.new
  end

  def create
    @product_request = ProductRequest.new(product_request_params)

    if @product_request.save
      render "show", status: :created
    else
      render "new"
    end
  end

  private

  def product_request_params
    params.require(:product_request).permit(:product_name)
  end
end
