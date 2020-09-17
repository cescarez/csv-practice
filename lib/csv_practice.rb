require 'csv'
require 'awesome_print'



def get_all_olympic_athletes(filename)
  temp_athletes = CSV.read('data/athlete_events.csv', headers: true).map { |row| row.to_h }
  athletes = temp_athletes.each do |athlete|
    athlete.filter! { |key| REQUIRED_OLYMPIAN_FIELDS.include?(key) }
  end
  return athletes
end

def total_medals_per_team(olympic_data)
  olympic_data.filter! { |athlete| athlete[REQUIRED_OLYMPIAN_FIELDS[-1]] != "NA" }
  all_medals = olympic_data.map do |athlete|
    athlete[REQUIRED_OLYMPIAN_FIELDS[-1]] != "NA"
    {athlete[REQUIRED_OLYMPIAN_FIELDS[3]] => athlete[REQUIRED_OLYMPIAN_FIELDS[-1]]}
  end

  team_medals = {}

  all_medals.each do |medal_info|
    medal_info.each do |team, medal|
      team_medals.member?(team) ? team_medals[team] += 1 : team_medals[team] = 1
    end
  end

  return team_medals
end

def get_all_gold_medalists(olympic_data)
  gold_medalists = olympic_data.select do |athlete|
    athlete[REQUIRED_OLYMPIAN_FIELDS[-1]] == "Gold"
  end

  return gold_medalists
end

