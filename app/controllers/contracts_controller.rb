class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit]

  def index
    @contracts = Contract.all
  end

  def show
  end

  def new
    @contract = Contract.new
    @periods = RentalPeriod.all
  end

  def create
    @contract = Contract.new(contract_params)
    @contract.calc_price
    if @contract.save
      redirect_to @contract
    else
      flash.now[:notice] = 'Não foi possível emitir contrato'
      render :new
    end
  end

  def edit
  end

  def create_delivery_receipt
    @contract = Contract.find(params[:id])
    @contract.create_delivery_receipt
    redirect_to @contract.delivery_receipt
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def contract_params
    params.require(:contract).permit(:contract_number, :order_number, :customer,
                                     :shipping_address, :shipping_contact,
                                     :rental_period_id,
                                     :date_begin, :date_end, :price, :discount,
                                     :status, equipment_ids: [])
  end
end
