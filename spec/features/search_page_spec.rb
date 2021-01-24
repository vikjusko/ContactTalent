feature "search page spec" do 
	it "lets user search for talent by the city" do
		visit '/search'
		expect(page).to have_content("Please insert a location - city (no abbreviations please) to find the talent you are looking for")
	end
end 