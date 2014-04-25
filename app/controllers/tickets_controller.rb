class TicketsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
    
  end

  def create
    @ticket = current_user.tickets.new(ticket_attributes)
    if @ticket.save
      redirect_to tickets_path, notice: "Your ticket was created"
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    
  end

  private

  def ticket_attributes
    params.require(:ticket).permit([:title,:body,:resolved])
  end


end
