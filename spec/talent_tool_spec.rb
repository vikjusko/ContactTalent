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
      expect(tool.filter('Tokio')).to eq 'Sorry, no-one lives in this city'
    end
  end
end
