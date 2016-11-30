class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:destroy]

  # POST /participants
  # POST /participants.json
  def create
    @participant = Participant.new(participant_params)
    @participant.save
    if request.env["HTTP_REFERER"].present?
      redirect_to :back
    else
      redirect_to :root
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    @participant.destroy
    if request.env["HTTP_REFERER"].present?
      redirect_to :back
    else
      redirect_to :root
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_params
      params.require(:participant).permit(:event_id, :user_id)
    end
end
