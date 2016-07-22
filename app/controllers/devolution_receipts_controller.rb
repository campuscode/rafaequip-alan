class DevolutionReceiptsController < ApplicationController
  def new
    @devolution_receipt = DevolutionReceipt.new
  end

  def create
    contract = Contract.find(params[:id])
    @devolution_receipt = DevolutionReceipt.create(
                          params.require(:devolution_receipt).permit(
                          :employer, :customer_document))
    redirect_to devolution_receipt_contract_path(contract)
  end
end
