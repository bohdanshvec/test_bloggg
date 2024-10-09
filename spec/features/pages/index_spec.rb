require 'rails_helper'

RSpec.describe 'feature root page', :feature do
  it "click on link 'Questions'" do
    visit root_path
    click_on 'Questions'
    expect(page).to have_content('Questions')
  end

  it 'click on link "New"' do
    visit root_path
    click_on 'New'
    expect(page).to have_content('New question')
  end
end