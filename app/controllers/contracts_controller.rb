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

  def create_delivery_receipt
    @contract = Contract.find(params[:id])
    @contract.create_delivery_receipt
    redirect_to @contract.delivery_receipt
  end

  private

  def contract_params
    params.require(:contract).permit(:contract_number, :order_number, :customer,
                                     :shipping_address, :shipping_contact,
                                     :rental_period,
                                     :date_begin, :date_end, :price, :discount,
                                     equipment_ids: [])
  end
end
