class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(genre_params)
      flash[:notice] = "変更が完了いたしました"
      redirect_to customer_path
    else
      render :edit
    end
  end

  def check
  end

  def withdraw
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :furigana_last_name, :furigana_first_name, :post_code, :address, :tel_number, :email, :active)
  end

end
