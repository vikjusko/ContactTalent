# frozen_string_literal: true

require 'json'
class TalentTool
  attr_reader :result

  def initialize
    @result = []
  end

  def self.create
    @talenttool = TalentTool.new
  end

  def self.instance
    @talenttool
  end

  def filter(city)
    raise 'Please input a valid city name' if city.is_a?(Integer)
    raise 'Please input a city name' if city.empty?

    file = File.read('data.json')
    new_data = JSON.parse(file).select { |x| x['location'].to_s.downcase == city.downcase }
    if new_data.empty?
      'Sorry, there is no talent that we have in this city'
    else
      result << new_data
      new_data.map! { |x| x['name'] }.join(("\n"))
    end
  end

  def add_talent(name, city, date_of_birth)
    # scanning data for existing names
    file = File.read('data.json')
    duplicate_data = JSON.parse(file).select { |x| x['name'] == name }
    return 'Sorry, this person has already been added to the system.' if duplicate_data.length.positive?

    # adds data if there's been no duplicate information found
    new_hash = { 'name' => name, 'location' => city, 'date_of_birth' => date_of_birth }
    file = File.read('data.json')
    secondJsonArray = JSON.parse(file)
    secondJsonArray << new_hash
    File.open('data.json', 'w') do |f|
      f.puts JSON.pretty_generate(secondJsonArray)
      return "#{name} has been added to the system, thank you!"
    end
  end
end
