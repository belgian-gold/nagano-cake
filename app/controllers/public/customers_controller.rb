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
    @customer = Customer.find(current_customer.id)
    @customer.update(is_membership_status: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :active)
  end

end
