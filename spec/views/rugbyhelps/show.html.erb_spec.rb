# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'rugbyhelps/show', type: :view do
  before(:each) do
    @rugbyhelp = assign(:rugbyhelp, Rugbyhelp.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
