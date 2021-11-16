# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'rugbyhelps/new', type: :view do
  before(:each) do
    assign(:rugbyhelp, Rugbyhelp.new)
  end

  it 'renders new rugbyhelp form' do
    render

    assert_select 'form[action=?][method=?]', rugbyhelps_path, 'post' do
    end
  end
end
