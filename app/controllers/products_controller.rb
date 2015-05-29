class ProductsController < ApplicationController
  def index
     @products = Shoppe::Product.root.ordered
  end
  
  def show
      @product = Shoppe::Product.find_by_permalink(params[:permalink])
  end
  
  def buy
    @product = Shoppe::Product.find_by_permalink!(params[:permalink])
    current_order.order_items.add_item(@product, 1)
    redirect_to product_path(@product.permalink), :notice => "O produto foi adicionado ao carrinho !"
  end
end
