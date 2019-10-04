Dir[File.dirname(__FILE__) + '/events/*.rb'].each { |file| require_relative file }
module SoccerSeason
  module Domain
    module Pitches
      class Pitch
        module Events
        end
      end
    end
  end
end