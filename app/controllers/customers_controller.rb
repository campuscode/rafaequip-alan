class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update]
  def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to @customer
    else
      flash[:notice] = 'Não foi possivel criar o cliente'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer
    else
      flash[:notice] = 'Não foi possível atualizar esse cliente'
      render 'edit'
    end
  end

  private

  def customer_params
    params.require(:customer)
          .permit(:code, :name, :document, :billing_address,
                  :billing_city, :billing_state,
                  :billing_zipcode, :financial_contact)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
