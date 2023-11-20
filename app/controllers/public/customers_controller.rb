class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
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
