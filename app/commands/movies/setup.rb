class Movies::Setup
  include Tzu

  def call(file)
    parse_csv = Csv::Parse.run(file)

    if parse_csv.success?
      parse_csv.result.each do |row|
        movie = Movie.where(title: row['DVD_Title']).first || Movie.new(title: row['DVD_Title'])

        movie.studio = row['Studio']
        begin
          movie.year = Date.strptime(row['Year'], '%Y')
        rescue
        end
        movie.genre = row['Genre']
        movie.price = (row['Price'].gsub('$', '').to_f * 100).to_i

        movie.save!
        puts "#{movie.inspect} imported \n"
      end
    else
      invalid!(parse_csv.result[:errors])
    end

    Movie.all
  end
end

