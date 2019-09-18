Dir[File.dirname(__FILE__) + '/commands/*.rb'].each {|file| require_relative file }
module SoccerSeason
  module Matches
    class Fixture
      module Commands
      end
    end
  end
end
