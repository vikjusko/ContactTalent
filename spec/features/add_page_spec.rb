# frozen_string_literal: true

feature 'Add Page content' do
  it 'Has a form to fill out to add a talent' do
    visit '/add'
    expect(page).to have_content('*Please add full name of the talent, city (no abbreviations please) & date of birth')
  end

  it 'lets a person add a talent by using a form' do
    visit '/add'
    fill_in 'name', with: 'Meg Griffin'
    fill_in 'location', with: 'Quahog'
    fill_in 'date_of_birth', with: '1999-11-01'
    click_button 'Add talent'
    expect(page).not_to have_content('*Please add full name of the talent, city (no abbreviations please) & date of birth')
  end

  it "does not let a person add a talent who's name is the same as an existing talent" do
    visit '/add'
    fill_in 'name', with: 'Homer Simpson'
    fill_in 'location', with: 'Springfield'
    fill_in 'date_of_birth', with: '1999-11-01'
    click_button 'Add talent'
    expect(page).to have_content('Sorry, this person has already been added to the system')
  end
end
