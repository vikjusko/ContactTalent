require "json"
class TalentTool


def filter(city)
  raise "Please input a valid city name" if city.is_a?(Integer)
  raise "Please input a city name" if city.empty?
  file = File.read("data.json")
  new_data = JSON.parse(file).select { |x| x["location"].to_s.downcase == city.downcase }
  if new_data.empty?
    "Sorry, no-one lives in this city"
	else
		new_data.each { |x| return x['name']}
    # (if new_data.length < 2
    #   new_data[0]["name"]
    # else
    #   new_data.map! do |x|
    #     x["name"]
    #   end.join("\n")
    # end)
	end
end

end 