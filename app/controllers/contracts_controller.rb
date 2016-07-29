class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :close]

  def index
    @contracts = Contract.all
  end

  def show
  end

  def new
    set_collection
    @equipment = Equipment.where(status: [:available])
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to @contract
    else
      flash.now[:notice] = 'Não foi possível emitir contrato'
      @equipment = Equipment.where(status: [:available])
      render :new
    end
  end

  def edit
  end

  def close
    @contract.close
    redirect_to @contract
  end

  def create_delivery_receipt
    @contract = Contract.find(params[:id])
    @contract.create_delivery_receipt
    redirect_to @contract.delivery_receipt
  end

  private

  def contract_params
    params.require(:contract).permit(:contract_number,
                                     :order_number, :customer_id,
                                     :shipping_address, :shipping_contact,
                                     :rental_period_id,
                                     :date_begin, :discount,
                                     equipment_ids: [])
  end

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def set_collection
    @contract = Contract.new
    @customers = Customer.all
    @periods = RentalPeriod.all
  end
end
