class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end
  
  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.get_coordinates

    if @invitation.save
      redirect_to invitation_path(@invitation)
    else
      render 'new' # Vuelve a renderizar el formulario si hay errores de validación
    end
  end

  def show
    @invitation = Invitation.find(params[:id])
    @mapsrc = @invitation.generate_map
  end

  private

  def invitation_params
    params.require(:invitation).permit(:host_name, :event_address, :host_phone, :event_description, :event_date)
  end
end
