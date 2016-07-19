class EquipmentController < ApplicationController
  def index
    @equipment = Equipment.all
    flash.now[:notice] = 'Nenhum equipamento cadastrado' if @equipment.empty?
  end
end
