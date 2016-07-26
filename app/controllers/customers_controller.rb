class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params.require(:customer)
                            .permit(:code, :name, :document, :billing_address,
                                    :billing_city, :billing_state,
                                    :billing_zipcode, :financial_contact))
    if @customer.save
      redirect_to @customer
    else
      flash[:notice] = 'Não foi possivel criar o cliente'
      render 'new'
    end
  end
end
