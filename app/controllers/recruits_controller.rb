# frozen_string_literal: true

class RecruitsController < ApplicationController
  before_action :set_recruit, only: %i[show edit update destroy]

  # GET /recruits or /recruits.json
  def index
    @recruits = Recruit.all.select { |p| p.person_type == 'Recruit' }
  end

  # GET /recruits/1 or /recruits/1.json
  def show; end

  # GET /recruits/new
  def new
    @recruit = Recruit.new
  end

  # GET /recruits/1/edit
  def edit; end

  def delete
    @recruit = Recruit.find(params[:id])
  end

  # POST /recruits or /recruits.json
  def create
    @recruit = Recruit.new(recruit_params)

    respond_to do |format|
      if @recruit.save
        format.html { redirect_to recruits_path, notice: 'Recruit was successfully created.' }
        format.json { render :show, status: :created, location: @recruit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recruit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recruits/1 or /recruits/1.json
  def update
    respond_to do |format|
      if @recruit.update(recruit_params)
        format.html { redirect_to recruits_path, notice: 'Recruit was successfully updated.' }
        format.json { render :show, status: :ok, location: @recruit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recruit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recruits/1 or /recruits/1.json
  def destroy
    @recruit.destroy
    respond_to do |format|
      format.html { redirect_to recruits_url, notice: 'Recruit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recruit
    @recruit = Recruit.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recruit_params
    params.require(:recruit).permit(:uin, :name, :email, :phone_number, :address, :person_type, :contact_type,
                                    :interest_level, :times_contacted, :date_contacted)
  end
end
