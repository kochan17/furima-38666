class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:new, :create]
  before_action :redirect_if_sold, only: [:new, :create]
  before_action :redirect_if_owner, only: [:new, :create]

  def new
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      Payjp.api_key = ENV[sk_test_0b93b5b828929192c0455699]
      Payjp::Charge.create(
        amount: order_form_params[:price],  # 商品の値段
        card: order_form_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )

      @order_form.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def order_form_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :phone_number, :street_address, :building_name).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_if_sold
    redirect_to root_path if PurchaseHistory.exists?(item_id: @item.id)
  end

  def redirect_if_owner
    redirect_to root_path if current_user == @item.user
  end

  def charge_payment
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_form_params[:token],
      currency: 'jpy'
    )
  end
end
