Dir[File.dirname(__FILE__) + '/invariants/*.rb'].each {|file| require_relative file }

module SoccerSeason
  module Matches
    class Pitch
      module Invariants
      end
    end
  end
end
