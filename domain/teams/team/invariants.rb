Dir[File.dirname(__FILE__) + '/invariants/*.rb'].each {|file| require_relative file }
module SoccerSeason
  module Domain
    module Teams
      class Team
        module Invariants
        end
      end
    end
  end
end