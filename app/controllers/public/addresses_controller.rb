class Public::AddressesController < ApplicationController
  def index
    @customer = current_customer
    @address = @customer.addresses
    @new_address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @new_address = Address.new(address_params)
    @new_address.customer_id = current_customer.id
    if @new_address.save
      flash[:notice] = "登録が完了しました"
      redirect_to addresses_path
    else
      @customer = current_customer
      @address = @customer.addresses
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "変更が完了しました"
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
      flash[:notice] = "削除が完了いたしました"
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
