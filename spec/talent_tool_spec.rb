require "talent_data.rb"

describe TalentTool do
	let(:tool) { described_class.new }

	  context 'testing filter method' do
    	it "filters a JSON hash by location and returns a person's name" do
      	expect(talent.filter('Philidelphia')).to eq 'Frank Reynolds'
			end
		end
end 