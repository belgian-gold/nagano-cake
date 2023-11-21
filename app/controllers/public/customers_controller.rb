class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "変更が完了いたしました"
      redirect_to customers_my_page_path
    else
      @customer = current_customer
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
