# frozen_string_literal: true

require 'json'
class TalentTool
  def filter(city)
    raise 'Please input a valid city name' if city.is_a?(Integer)
    raise 'Please input a city name' if city.empty?

    file = File.read('data.json')
    new_data = JSON.parse(file).select { |x| x['location'].to_s.downcase == city.downcase }
    if new_data.empty?
      'Sorry, no-one lives in this city'
    else
      new_data.map! { |x| x['name'] }.join(("\n"))
    end
	end
	
	  context 'add_data method' do
    it 'add_data adds a new name if the name is non existant in the system' do
      tool.add_talent('William Burnside', 'Nottingham','1994-01-19')
      expect(tool.filter('Nottingham')).to eq 'William Burnside'
		end
	end

end

