require 'csv'
require 'awesome_print'



def get_all_olympic_athletes(filename)
  athletes = CSV.read(filename, headers: true).map { |row| row.to_h }
  athletes.each do |athlete|
    athlete.filter! { |key| REQUIRED_OLYMPIAN_FIELDS.include?(key) }
  end
  return athletes
end

def total_medals_per_team(olympic_data)
  olympic_data.filter! { |athlete| athlete[REQUIRED_OLYMPIAN_FIELDS[-1]] != "NA" }
  all_medals = olympic_data.map do |athlete|
    if athlete[REQUIRED_OLYMPIAN_FIELDS[-1]] != "NA"
      {athlete[REQUIRED_OLYMPIAN_FIELDS[3]] => athlete[REQUIRED_OLYMPIAN_FIELDS[-1]]}
    end
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
  gold_medalists = olympic_data.filter do |athlete|
    athlete[REQUIRED_OLYMPIAN_FIELDS[-1]] == "Gold"
  end

  return gold_medalists
end

def team_with_most_medals(medal_totals)
  top_medals = medal_totals.max_by { |team, count| count }
  return {top_medals[0] => top_medals[1]}
end

def athlete_height_in_inches(olympic_data)
  height_in_inches = olympic_data.select { |athlete| athlete[REQUIRED_OLYMPIAN_FIELDS[2]] != "NA" }
  height_in_inches.each do |athlete|
    athlete.transform_values! do |field|
      if field == athlete[REQUIRED_OLYMPIAN_FIELDS[2]]
        athlete[REQUIRED_OLYMPIAN_FIELDS[2]].to_f / 2.54
      end
    end
  end
  return height_in_inches
end