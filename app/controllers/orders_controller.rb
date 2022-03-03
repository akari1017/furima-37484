class OrdersController < ApplicationController
  
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      Payjp.api_key = "sk_test_914464b0a7be9a404d3fcacd"
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:zip, :region_id, :city, :block, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
