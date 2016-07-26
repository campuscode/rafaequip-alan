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
    @equipment = Equipment.where(available: true)
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to @contract
    else
      flash.now[:notice] = 'Não foi possível emitir contrato'
      @equipment = Equipment.where(available: true)
      render :new
    end
  end

  def edit
  end
end

private

def contract_params
  params.require(:contract).permit(:contract_number, :order_number, :customer,
                                   :shipping_address, :shipping_contact,
                                   :rental_period_id,
                                   :date_begin, :date_end, :price, :discount,
                                   equipment_ids: [])
end

def set_contract
  @contract = Contract.find(params[:id])
end
