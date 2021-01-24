feature "Add Page content" do
  it "Has a form to fill out to add a talent" do
    visit "/add"
    expect(page).to have_content("*Please add full name of the talent, city (no abbreviations please) & date of birth")
  end

end
