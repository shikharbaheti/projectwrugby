# frozen_string_literal: true

json.array! @encounters, partial: 'encounters/encounter', as: :encounter
