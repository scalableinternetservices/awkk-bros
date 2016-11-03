class ParticipantsController < ApplicationController
  # POST /participants
  # POST /participants.json
  def create
    @participant = Participant.new(participant_params)
    @participant.save
    redirect_to :back
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_params
      params.require(:participant).permit(:event_id, :user_id)
    end
end
