# frozen_string_literal: true

feature 'Main page content' do
  scenario 'User can see welcome message, option to add a talent or search for talend' do
    visit '/'
    expect(page).to have_content "Home Search Add\nAdd Talent\nSeach for Talent"
    expect(page).to have_selector(:link_or_button, 'Seach for Talent')
    expect(page).to have_selector(:link_or_button, 'Add Talent')
  end

  scenario 'User clicks on add on the main page and gets transfered to a different page' do
    visit '/'
    click_button 'Add Talent'
    expect(page).to have_content('*Please add full name of the talent, city (no abbreviations please) & date of birth')
  end

  scenario 'User clicks on search on the main page and gets transfered to a serch page' do
    visit '/'
    click_button 'Seach for Talent'
    expect(page).to have_content('Please insert a location - city (no abbreviations please) to find the talent you are looking for')
  end
end
