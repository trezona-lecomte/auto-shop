class ProductRequestsController < ApplicationController
  def new
    @product_request = ProductRequest.new
  end

  def create
    @product_request = ProductRequest.new(product_request_params)

    if @product_request.save

    else
      render "new"
    end
  end

  private

  def product_request_params
    params.require(:product_request).permit(:product_name)
  end
end
