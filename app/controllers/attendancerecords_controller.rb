# frozen_string_literal: true

class AttendancerecordsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :get_event
  before_action :set_attendancerecord, only: %i[show edit update destroy]

  # GET /attendancerecords or /attendancerecords.json
  def index
    @attendancerecords = @event.attendancerecords
    @players = Player.all
  end

  # GET /attendancerecords/1 or /attendancerecords/1.json
  def show; end

  # GET /attendancerecords/new
  def new
    @event = Event.find(params[:event_id])
    @attendancerecord = @event.attendancerecords.build
  end

  # GET /attendancerecords/1/edit
  def edit; end

  def delete
    @event = Event.find(params[:event_id])
    @attendancerecord = @event.attendancerecords.find(params[:id])
  end

  # POST /attendancerecords or /attendancerecords.json
  def create
    @event = Event.find(params[:event_id])
    @attendancerecord = @event.attendancerecords.create(attendancerecord_params)

    respond_to do |format|
      if @attendancerecord.save
        # @player = Player.find(params[:player_id])
        # @attendancerecord.players << @player
        format.html do
          redirect_to event_attendancerecords_path(@event), notice: 'Attendance record was successfully created.'
        end
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
        format.html { redirect_to events_path, notice: 'Attendancerecord was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendancerecord }

      end
    end
  end

  # DELETE /attendancerecords/1 or /attendancerecords/1.json
  def destroy
    @attendancerecord.destroy
    respond_to do |format|
      format.html { redirect_to events_path, notice: 'Attendancerecord was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def get_event
    @event = Event.find(params[:event_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_attendancerecord
    @attendancerecord = @event.attendancerecords.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def attendancerecord_params
    params.require(:attendancerecord).permit(:attendancetype, :note, :event_id, :player_id)
  end
end
