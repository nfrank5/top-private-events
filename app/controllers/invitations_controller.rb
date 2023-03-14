class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @invitation = current_user.invitations.build(attended_event_id: params[:event_id])

    if @invitation.save
      redirect_to root_path
      flash[:notice] = "You have successfully added the Event: #{Event.find(params[:event_id]).name}"
    else
      render root_path, status: :unprocessable_entity
    end

  end

end
