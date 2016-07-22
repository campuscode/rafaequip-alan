class DevolutionReceiptsController < ApplicationController
  def show
    @devolution_receipt = DevolutionReceipt.find(params[:id])
  end

  def new
    @contract = Contract.find(params[:contract_id])
    @devolution_receipt = DevolutionReceipt.new
    @devolution_receipt.contract = @contract
  end

  def create
    contract = Contract.find(params[:contract_id])
    @devolution_receipt = DevolutionReceipt.new(params
    .require(:devolution_receipt).permit(:employer, :customer_document))
    @devolution_receipt.contract = contract
    @devolution_receipt.save
    redirect_to contract_devolution_receipt_path(contract, @devolution_receipt)
  end
end
