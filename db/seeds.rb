require "csv"

state_data = File.read(Rails.root.join("lib", "seeds", "state_data.csv"))
state_data_csv = CSV.parse(state_data, :headers => true, :encoding => "ISO-8859-1")
state_data_csv.each do |row|
  s = State.new
  s.state = row["state"]
  s.median_income = row["median_household_income"]
  s.unemployment = row["share_unemployed_seasonal"]
  s.metro_population = row["share_population_in_metro_areas"]
  s.adults_with_hs = row["share_population_with_high_school_degree"]
  s.save!
end

# puts "#{State.count} states added to DB"

abbrev_text = File.read(Rails.root.join("lib", "seeds", "abbreviations.csv"))
abbrev_csv = CSV.parse(abbrev_text, :headers => true, :encoding => "UTF-8", liberal_parsing: true)
abbrev_csv.each do |row|
  state = abbrev_csv.headers[0]
  s = State.find_by(state: [row[state]])
  s.abbreviation = row["Abbrev"]
  s.code = row["Code"]
  s.save!
end
