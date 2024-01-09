class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end
  
  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.get_coordinates
    @invitation.format_phone(country_code: params[:invitation][:country_code])

    if @invitation.save
      redirect_to invitation_path(@invitation)
    else
      render 'new' # Vuelve a renderizar el formulario si hay errores de validación
    end
  end

  def show
    @invitation = Invitation.find(params[:id])
    if @invitation.event_latitude.present? && @invitation.event_longitude.present?
      @mapsrc = @invitation.generate_map
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:host_name, :event_address, :host_phone, :event_description, :event_date)
  end
end
