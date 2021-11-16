# frozen_string_literal: true

class AlumnisController < ApplicationController
  before_action :set_alumni, only: %i[show edit update destroy]

  # GET /alumnis or /alumnis.json
  def index
    @people = Person.all.select { |p| p.person_type == 'Alumni' }
  end
end
