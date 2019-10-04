Dir[File.dirname(__FILE__) + '/events/*.rb'].each { |file| require_relative file }
module SoccerSeason
  module Domain
    module Matches
      class Match
        module Events
        end
      end
    end
  end
end