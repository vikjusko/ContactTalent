# frozen_string_literal: true

feature 'search page spec' do
  it 'lets user search for talent by the city' do
    visit '/search'
    expect(page).to have_content('Please insert a location - city (no abbreviations please) to find the talent you are looking for')
  end

  it 'it finds the user that lives in a submitted city ' do
    visit '/search'
    fill_in 'location', with: 'Seattle'
    click_button 'Search'
    expect(page).to have_content("Home Search Add\nMorty Smith, Summer Smith")
  end

  it 'it finds the user that lives in a submitted city ' do
    visit '/search'
    fill_in 'location', with: 'Springfield'
    click_button 'Search'
    expect(page).to have_content("Home Search Add\nHomer Simpson, Krusty the Clown")
  end

  it 'lets a user know if noone lives in the city' do
    visit '/search'
    fill_in 'location', with: 'Tokyo'
    click_button 'Search'
    expect(page).to have_content('Sorry, there is no talent that we have in this city')
  end
end
