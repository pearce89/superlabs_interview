class Csv::Parse
  include Tzu

  def call(data)
    csv = CSV.parse(data, headers: true)

    if csv.size > 0
      csv
    else
      invalid!('Invalid or blank CSV data')
    end
  end
end