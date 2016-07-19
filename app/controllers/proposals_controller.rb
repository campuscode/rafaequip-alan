class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.all
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(params.require(:proposal).permit(:name, :mail,
                                                              :phone,
                                                              :description))
    if @proposal.save
      flash[:notice] = 'Solicitação enviada com sucesso!'
      redirect_to @proposal
    else
      flash.now[:notice] = 'Não foi possivel fazer a solicitação'
      render :new
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
  end
end
