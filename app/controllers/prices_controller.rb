class PricesController < ApplicationController
  def index
    @prices = Price.all.order(created_at: :desc)
  end

  def new
    @price = Price.new
    set_collection
  end

  def create
    @price = Price.new(params.require(:price).permit(:amount, :rental_period_id,
                                                     :equipment_id))
    if @price.save
      redirect_to prices_path
    else
      set_collection
      flash.now[:notice] = 'Não foi possível criar um novo preço.'
      render :new
    end
  end

  private

  def set_collection
    @periods = RentalPeriod.all
    @equipment = Equipment.all
  end
end
