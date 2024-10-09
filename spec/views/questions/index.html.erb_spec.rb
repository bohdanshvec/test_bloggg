# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'questions/index', :view do
  it 'display questions#index' do
    question = create(:question)
    assign(:questions, [question])
    render
    expect(rendered).to match(/#{question.title}/)
  end
end
