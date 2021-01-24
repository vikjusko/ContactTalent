# frozen_string_literal: true

require 'talent_tool'

describe TalentTool do
  let(:tool) { described_class.new }

  context 'testing filter method' do
    it "filters a JSON hash by location and returns a person's name" do
      expect(tool.filter('Philidelphia')).to eq 'Frank Reynolds'
    end

    it 'Finds Homer and Dusty in Springfield' do
      expect(tool.filter('Springfield')).to eq "Homer Simpson\nKrusty the Clown"
    end

    it "let's the user know if the location does not return any names" do
      expect(tool.filter('Tokio')).to eq 'Sorry, there is no talent that we have in this city'
    end

    it 'prompts the user to input a city rather than passing an empty sting' do
      expect { tool.filter('') }.to raise_error 'Please input a city name'
    end

    it 'doesnt let a user inut an integer' do
      expect { tool.filter(123) }.to raise_error 'Please input a valid city name'
    end
  end

  context 'add_data method' do
    it 'add_data adds a new name if the name is non existant in the system' do
      tool.add_talent('Morty Smith', 'Seattle', '1943-01-19')
      expect(tool.filter('Seattle')).to eq "Morty Smith\nSummer Smith"
    end

    it 'lets user know that the person they are trying to add already exists in the system' do
      expect(tool.add_talent('Frank Reynolds', 'Nottingham',
                             '1994-01-19')).to eq 'Sorry, this person has already been added to the system'
    end
  end

  context '#self.instance' do
    it 'returns an instance of the talenttool' do
      TalentTool.create
      expect(TalentTool.instance).to be_an_instance_of(TalentTool)
    end
  end
end
