module SoccerSeason
  module Domain
    module Pitches
      class Pitch
        module Factories
          class Default
            def self.factory(args)
              Pitch.new(args)
            end
          end
        end
      end
    end
  end
end