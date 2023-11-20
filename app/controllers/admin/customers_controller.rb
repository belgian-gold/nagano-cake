class Admin::CustomersController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def update
  end

private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :furigana_last_name, :furigana_first_name, :post_code, :address, :tel_number, :email, :is_active)
  end

end
