# frozen_string_literal: true

class RugbyhelpsController < ApplicationController
  before_action :set_rugbyhelp, only: %i[show edit update destroy]

  # GET /rugbyhelps or /rugbyhelps.json
  def index
    @rugbyhelps = Rugbyhelp.all
  end

  # GET /rugbyhelps/1 or /rugbyhelps/1.json
  def show; end

  # GET /rugbyhelps/new
  def new
    @rugbyhelp = Rugbyhelp.new
  end

  # GET /rugbyhelps/1/edit
  def edit; end

  # POST /rugbyhelps or /rugbyhelps.json
  def create
    @rugbyhelp = Rugbyhelp.new(rugbyhelp_params)

    respond_to do |format|
      if @rugbyhelp.save
        format.html { redirect_to @rugbyhelp, notice: 'Rugbyhelp was successfully created.' }
        format.json { render :show, status: :created, location: @rugbyhelp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rugbyhelp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rugbyhelps/1 or /rugbyhelps/1.json
  def update
    respond_to do |format|
      if @rugbyhelp.update(rugbyhelp_params)
        format.html { redirect_to @rugbyhelp, notice: 'Rugbyhelp was successfully updated.' }
        format.json { render :show, status: :ok, location: @rugbyhelp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rugbyhelp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rugbyhelps/1 or /rugbyhelps/1.json
  def destroy
    @rugbyhelp.destroy
    respond_to do |format|
      format.html { redirect_to rugbyhelps_url, notice: 'Rugbyhelp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rugbyhelp
    @rugbyhelp = Rugbyhelp.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def rugbyhelp_params
    params.fetch(:rugbyhelp, {})
  end
end
