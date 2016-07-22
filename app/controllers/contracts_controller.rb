class ContractsController < ApplicationController

  def index
    #code
  end

  def show
    @contract = Contract.find(params[:id])
  end

  def new
    @contract = Contract.new
    @periods = RentalPeriod.all
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to @contract
    else
      flash.now[:notice] = 'Não foi possível emitir contrato'
      render :new
    end
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
