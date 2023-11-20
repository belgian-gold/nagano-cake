class Public::AddressesController < ApplicationController
  def index
    @customer = current_customer
    @addresses = @customer.address
    @new_address = Address.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end

end
