class Public::AddressesController < ApplicationController
  def index
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
