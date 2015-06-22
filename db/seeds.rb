require 'csv'
  
# CSV.foreach('records.csv', headers: true) do |line|
#   puts line
# end

CSV.foreach("db/records.csv", headers: true, header_converters: :symbol, converters: :all) do |row|
  label  = Label.find_or_create_by(title: row[:label])
  artist = Artist.find_or_create_by(name: row[:artist])

  Album.create(
    label_id: label.id,
    artist_id: artist.id,
    released_year: row[:released],
    format: row[:format],
    label_code: row[:labelcode],
    title: row[:title]
  ) 
end
