class CartsController < ApplicationController


  def show
  end

  def add_item
    product_id = params[:product_id].to_s
    product = Product.find(product_id)
    puts 'product'
    puts product.inspect
    item = cart[product_id] || { "quantity" => 0 }
    if product.quantity > item["quantity"]
      item["quantity"] += 1
      cart[product_id] = item
      update_cart cart

      redirect_to :back
    else
      session[:error_message] = "We don't have enough of that item in stock to add any more."
      redirect_to :back
    end
  end

  def remove_item
    product_id = params[:product_id].to_s

    item = cart[product_id] || { "quantity" => 1 }
    item["quantity"] -= 1
    cart[product_id] = item
    cart.delete(product_id) if item["quantity"] < 1
    update_cart cart

    redirect_to :back
  end

end
