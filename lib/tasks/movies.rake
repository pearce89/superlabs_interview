require 'csv'

namespace :movies do
  task import: :environment do
    file = File.read(Rails.root.join('lib/tasks/movies.csv'))
    Movies::Setup.run(file)
  end
end