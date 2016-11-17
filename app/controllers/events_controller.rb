class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    if stale?([Event.all])
      if params[:search]
        @events = Event.search(params[:search]).order("created_at DESC")
      else
        @events = Event.all.order('created_at DESC')
      end
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @comment = Comment.new if stale?(Comment.all)
    fresh_when([@event, @event.comments, @event.participants])
  end

  # REST API GET /events/1/participants_count
  # REST API GET /events/1/participants_count.json
  def participants_count
    @num = Participant.where(event_id: params[:id]).count
    render json: @num, status: :ok
  end

  # GET /events/new
  def new
    @event = Event.new if stale?(Event.all)
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :description, :location, :user_id)
    end
end
