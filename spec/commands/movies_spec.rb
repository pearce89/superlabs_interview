require 'rails_helper'
require 'csv'

RSpec.describe Movies::Setup do

  let(:header) { %w(DVD_Title Studio Released Status Sound Versions Price Rating Year Genre Aspect UPC DVD_ReleaseDate ID Timestamp Updated) }

  let(:rows) do
    [
      ['10-Movie Horror Collection, Vol. 14','Echo Bridge','7/3/17','Pending','2.0','4:3','$14.99','NR','VAR','Horror','1.33:1','096009468446','7/3/17','300032','5/9/17','0'],
      ['100: Complete 4th Season','Warner Brothers','7/18/17','Pending','5.1','LBX, 16:9','$24.98','NR','2017','TV Classics','1.78:1','883929564590','7/18/17','300071','5/9/17','0']
    ]
  end

  let(:file) do
    CSV.generate do |csv|
      csv << header
      rows.each { |row| csv << row }
    end
  end

  it 'runs gracefully with no subscribers' do
    movies_setup = Movies::Setup.run(file)

    expect(movies_setup.success?).to eq(true)
    expect(movies_setup.result.count).to eq(rows.size)
  end

end