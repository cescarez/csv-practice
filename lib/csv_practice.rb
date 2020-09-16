require 'csv'
require 'awesome_print'

REQUIRED_OLYMPIAN_FIELDS = %w[ID Name Height Team Year City Sport Event Medal]

def get_all_olympic_athletes(filename)
  # athletes = CSV.read('data/athlete_events.csv', headers: true).map { |row| row.to_h }
  temp_athletes = CSV.read('data/athlete_events.csv', headers: true).map { |row| row.to_h }
  athletes = temp_athletes.each do |athlete|
    athlete.filter! { |key| REQUIRED_OLYMPIAN_FIELDS.include?(key) }
  end
  return athletes
end

def total_medals_per_team(olympic_data)

end

def get_all_gold_medalists(olympic_data)
end
