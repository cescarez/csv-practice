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
  all_medals = []
  olympic_data.each do |athlete|
    if athlete[REQUIRED_OLYMPIAN_FIELDS[-1]] != "NA"
      all_medals << {athlete[REQUIRED_OLYMPIAN_FIELDS[3]] => athlete[REQUIRED_OLYMPIAN_FIELDS[-1]]}
    else
      next
    end
  end

  team_medals = {}

  all_medals.each do |medal_info|
    medal_info.each do |team, medal|
      if team_medals.member?(team)
        team_medals[team] += 1
      else
        team_medals[team] = 1
      end
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
def team_with_most_medals(medal_totals)
  return medal_totals.max { |team| [team] }
end

def athlete_height_in_inches(olympic_data)

end
