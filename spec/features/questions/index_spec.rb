require 'rails_helper'

RSpec.describe 'feature page index', :feature do
  it 'click on "Home"' do
    visit questions_path
    click_on 'Home'
    expect(page).to have_content('Hello')
  end

  describe 'Question menagement', :feature do
    it 'allows a user to create, view, and delete a question' do
      visit questions_path
      click_on 'New'
      fill_in 'Title', with: 'Test Question'
      fill_in 'Body', with: 'Details about the question'
      click_on 'Submit question'
      expect(page).to have_content('Test Question')
      click_on 'Destroy'
      expect(page).to have_no_content('Test Question')
    end
  end
end