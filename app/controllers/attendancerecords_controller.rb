class AttendancerecordsController < ApplicationController
  #before_action :set_event
  before_action :set_attendancerecord, only: %i[ show edit update destroy ]

  # GET /attendancerecords or /attendancerecords.json
  def index
    @attendancerecords = Attendancerecord.all
    #@attendancerecords = Attendancerecord.find_by_id(@event.id)
    #@events = Event.all
    #@attendancerecords = Attendancerecord.all.select { |a| a.event_id == @event.id }
  end

  # GET /attendancerecords/1 or /attendancerecords/1.json
  def show
  end

  # GET /attendancerecords/new
  def new
    @attendancerecord = Attendancerecord.new
    #@attendancerecord = Attendancerecord.build.event(:event_id)
  end

  # GET /attendancerecords/1/edit
  def edit
  end

  def delete
    @attendancerecord = Attendancerecord.find(params[:id])
  end

  # POST /attendancerecords or /attendancerecords.json
  def create
    @attendancerecord = Attendancerecord.new(attendancerecord_params)

    respond_to do |format|
      if @attendancerecord.save
        format.html { redirect_to events_path, notice: "Attendancerecord was successfully created." }
        format.json { render :show, status: :created, location: @attendancerecord }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attendancerecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendancerecords/1 or /attendancerecords/1.json
  def update
    respond_to do |format|
      if @attendancerecord.update(attendancerecord_params)
        format.html { redirect_to events_path, notice: "Attendancerecord was successfully updated." }
        format.json { render :show, status: :ok, location: @attendancerecord }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attendancerecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendancerecords/1 or /attendancerecords/1.json
  def destroy
    @attendancerecord.destroy
    respond_to do |format|
      format.html { redirect_to events_path, notice: "Attendancerecord was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendancerecord
      @attendancerecord = Attendancerecord.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    # Only allow a list of trusted parameters through.
    def attendancerecord_params
      params.require(:attendancerecord).permit(:note, :attendancetype, :event_id, :player_id)
    end
end
