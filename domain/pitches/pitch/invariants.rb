Dir[File.dirname(__FILE__) + '/invariants/*.rb'].each {|file| require_relative file }

module SoccerSeason
  module Pitches
    class Pitch
      module Invariants
      end
    end
  end
end
