# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pages/index', :view do
  it 'display pages#index' do
    render

    expect(rendered).to match(/Hello, welcome to Bloggg./)
  end
end
