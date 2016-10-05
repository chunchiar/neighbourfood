class OrdersController < ApplicationController

  # before_action :checkIfOrderBelongsToUser, only: [:show]

  TRANSACTION_SUCCESS_STATUSES = [
    Braintree::Transaction::Status::Authorizing,
    Braintree::Transaction::Status::Authorized,
    Braintree::Transaction::Status::Settled,
    Braintree::Transaction::Status::SettlementConfirmed,
    Braintree::Transaction::Status::SettlementPending,
    Braintree::Transaction::Status::Settling,
    Braintree::Transaction::Status::SubmittedForSettlement,
  ]

  def create
    amount = params["total_cost"]
    nonce = params["payment_method_nonce"]

    result = Braintree::Transaction.sale(
      amount: amount,
      payment_method_nonce: nonce,
    )

    if result.success? || result.transaction
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
      puts ">>>>>>>>>>>>> success >>>>>>>>>>>"
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

      create_order(result.transaction.id)
    else
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
      puts ">>>>>>>>>>>>>>> fail >>>>>>>>>>>>"
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
      puts error_messages
      flash.now[:danger] = error_messages
    end

  end

  def create_order(transaction_id)

    # @order = current_user.orders.build(order_params);
    @order = Order.new
    @order.user_id = current_user.id
    @order.payment_id = transaction_id
    @order.product_id = params["braintree"]["product_id"]
    @order.address = params["braintree"]["address"]
    @order.phone = params["braintree"]["phone"]
    @order.email = params["braintree"]["email"]
    @order.total_cost = params["total_cost"]
    @order.quantity = params["braintree"]["quantity"]

    if @order.save
      # flash.now[:success] = "You've created a new post."
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
      puts ">>>>>>>>>> Order created >>>>>>>>"
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
      redirect_to order_path(@order)
    else
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
      puts ">>>>>> Fail to create order >>>>>"
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
      flash[:danger] = @order.errors.full_messages
      redirect_to menu_path(@order.product_id)
    end
  end

  def _create_result_hash(transaction)
    status = transaction.status

    if TRANSACTION_SUCCESS_STATUSES.include? status
      result_hash = {
        :header => "Sweet Success!",
        :icon => "success",
        :message => "Your test transaction has been successfully processed. See the Braintree API response and try again."
      }
    else
      result_hash = {
        :header => "Transaction Failed",
        :icon => "fail",
        :message => "Your test transaction has a status of #{status}. See the Braintree API response and try again."
      }
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    if @order == nil
      redirect_to user_path(current_user)
      return
    end
    
    @product = Product.friendly.find(@order.product_id)

    checkIfOrderBelongsToUser(@order)


    if current_user
      @fav = Favourite.find_by(keeper_id: current_user.id, fav_id: @product.user.id)
      if @fav
        @class = "btn-danger"
        @text = "Unfollow Chef"
      else
        @class = "btn-success"
        @text = "Follow Chef"
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :quantity, :phone, :email, :address, :total_cost)
  end

  def checkIfOrderBelongsToUser(order)
    if order.user != current_user
      redirect_to user_path(current_user)
    end
  end

end
