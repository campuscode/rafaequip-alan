class EquipmentController < ApplicationController
  before_action :find_equipment, only: [:show, :edit, :update]

  def show
    
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
      redirect_to @equipment
    else
      flash[:notice] = 'Não foi possível criar o equipamento!'
      render :new
    end
  end

  def edit
  end

  def update
    if @equipment.update_attributes(equipment_params)
      redirect_to @equipment
    else
      flash[:notice] = 'Não foi possível atualizar o equipamento!'
      render :edit
    end 
  end

  private

  def equipment_params
    params.require(:equipment).permit(:customer_code, :description, :category, :price, :serial_number, :status)
  end

  def find_equipment
    @equipment = Equipment.find(params[:id])
  end  
end
