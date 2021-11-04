class EncountersController < ApplicationController
  before_action :set_encounter, only: %i[ show edit update destroy ]

  # GET /encounters or /encounters.json
  def index
    @encounters = Encounter.all
  end

  # GET /encounters/1 or /encounters/1.json
  def show
  end

  # GET /encounters/new
  def new
    @encounter = Encounter.new
  end

  # GET /encounters/1/edit
  def edit
  end

  def delete
    @encounter = Encounter.find(params[:id])
  end

  # POST /encounters or /encounters.json
  def create
    @encounter = Encounter.new(encounter_params)

    respond_to do |format|
      if @encounter.save
        format.html { redirect_to @encounter, notice: "Encounter was successfully created." }
        format.json { render :show, status: :created, location: @encounter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @encounter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /encounters/1 or /encounters/1.json
  def update
    respond_to do |format|
      if @encounter.update(encounter_params)
        format.html { redirect_to @encounter, notice: "Encounter was successfully updated." }
        format.json { render :show, status: :ok, location: @encounter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @encounter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encounters/1 or /encounters/1.json
  def destroy
    @encounter.destroy
    respond_to do |format|
      format.html { redirect_to encounters_url, notice: "Encounter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encounter
      @encounter = Encounter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def encounter_params
      params.require(:encounter).permit(:recruit_id, :notes)
    end
end
