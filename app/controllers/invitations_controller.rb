class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @invitation = current_user.invitations.build(attended_event_id: params[:event_id])

    if @invitation.save
      flash[:notice] = "You have successfully added the Event: #{Event.find(params[:event_id]).name}"
      redirect_to root_path
    else
      flash.now[:alert] = "You are already in that Event list."
      render "users/show", status: :unprocessable_entity 
    end
  end

end
