class DeliveryReceiptController < ApplicationController
  def show
    @delivery_receipt = DeliveryReceipt.find(params[:id])
  end
end
