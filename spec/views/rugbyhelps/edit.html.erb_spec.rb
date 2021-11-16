# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'rugbyhelps/edit', type: :view do
  before(:each) do
    @rugbyhelp = assign(:rugbyhelp, Rugbyhelp.create!)
  end

  it 'renders the edit rugbyhelp form' do
    render

    assert_select 'form[action=?][method=?]', rugbyhelp_path(@rugbyhelp), 'post' do
    end
  end
end
