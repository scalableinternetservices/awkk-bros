module EventsHelper
  def cache_key_for_event_table
    "event-table-#{Event.maximum(:updated_at)}-#{Participant.maximum(:updated_at)}"
  end

	def cache_key_for_event_row(event)
    "event-#{event.id}-#{event.updated_at}-#{event.participants.length}"
	end
  

  def cache_key_for_event_participants(event)
    "event-participants-#{event.id}-#{event.updated_at}-#{event.participants.length}-#{event.participants.maximum(:updated_at)}"
  end

  def cache_key_for_event_comments(event)
    "event-comments-#{event.id}-#{event.updated_at}-#{event.comments.length}-#{event.comments.maximum(:updated_at)}"
  end
end
