class DevolutionReceiptsController < ApplicationController
  before_action :set_contract, only: [:new, :create]

  def show
    @devolution_receipt = DevolutionReceipt.find(params[:id])
  end

  def new
    @devolution_receipt = DevolutionReceipt.new
    @devolution_receipt.contract = @contract
  end

  def create
    @devolution_receipt = DevolutionReceipt.new(params
    .require(:devolution_receipt).permit(:employer, :customer_document))
    @devolution_receipt.contract = @contract
    @devolution_receipt.save
    redirect_to contract_devolution_receipt_path(@contract, @devolution_receipt)
  end

  private

  def set_contract
    @contract = Contract.find(params[:contract_id])
  end
end
