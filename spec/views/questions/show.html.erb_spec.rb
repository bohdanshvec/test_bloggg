# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'questions/show', :view do
  it 'display questions#show' do
    question = create(:question)
    assign(:question, question)
    render
    expect(rendered).to have_content(question.title.to_s)
  end
end
