module EventsHelper
  def cache_key_for_event_table
    "event-table-#{Event.maximum(:updated_at)}-#{Participant.maximum(:updated_at)}"
  end

	def cache_key_for_event_row(event)
    "event-#{event.id}-#{event.updated_at}-#{event.participants.length}"
	end
end
