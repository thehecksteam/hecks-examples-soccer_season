module SoccerSeason
  module Domain
    module Pitches
      class Pitch
        module Factories
          class Build
            def self.factory(args)
              Pitch.new(
                id: args[:id],
                name: args[:name],
              )
            end
          end
        end
      end
    end
  end
end
