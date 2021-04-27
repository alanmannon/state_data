require "csv"

state_data = File.read(Rails.root.join("lib", "seeds", "state_data.csv"))
state_data_csv = CSV.parse(state_data, :headers => true, :encoding => "ISO-8859-1")
state_data_csv.each do |row|
  s = State.new
  s.state = row["state"]
  s.median_income = row["median_income"]
  s.unemployment = row["unemployment"]
  s.metro_population = row["metro_population"]
  s.adults_with_hs = row["adults_with_hs"]
  s.save
end

puts "#{State.count} states added to DB"

# abbrev_text = File.read(Rails.root.join("lib", "seeds", "abbreviations.csv"))
# abbrev_csv = CSV.parse(abbrev_text, headers: :first_row, :liberal_parsing => true, :encoding => "ISO-8859-1")
# abbrev_csv.each do |row|
#   puts row.to_hash
# end
