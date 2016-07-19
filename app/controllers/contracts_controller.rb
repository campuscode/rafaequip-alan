class ContractsController < ApplicationController
  def show
    @contract = Contract.find(params[:id])
  end

  def new
    @contract = Contract.new
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
  params.require(:contract).permit(:contract_number, :order_number, :customer,:shipping_address,
  :shipping_contact, :rental_period, :rented_equipments, :date_begin, :date_end, :price, :discount)
end
