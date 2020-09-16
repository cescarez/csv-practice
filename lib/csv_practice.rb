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



  all_medals = olympic_data.map do |athlete|
    if REQUIRED_OLYMPIAN_FIELDS[-1] != "NA"
      {athlete[REQUIRED_OLYMPIAN_FIELDS[3]] => athlete[REQUIRED_OLYMPIAN_FIELDS[-1]]}
    else
      next
    end
  end
  all_medals = all_medals.sort.to_h
  ap all_medals
  current_team = ''
  team_medals = []
  all_medals.each do |team|
    if current_team == team
      team_medals[team] += 1
    else
      current_team = team
      team_medals << {team => 1}
    end
  end

  # team_medals = all_medals.sort_ do |team| {team => team.count
  ap team_medals
end

def get_all_gold_medalists(olympic_data)
end
