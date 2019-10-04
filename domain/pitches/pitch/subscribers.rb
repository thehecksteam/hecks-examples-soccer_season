Dir[File.dirname(__FILE__) + '/subscribers/*.rb'].each { |file| require_relative file }
module SoccerSeason
  module Domain
    module Pitches
      class Pitch
        module Subscribers
        end
      end
    end
  end
end
