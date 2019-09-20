module SoccerSeason
  module Domain
    module Matches
      class Pitch
        module Factories
          class Build
            def self.factory(args)
              Pitch.new(
                name: args[:name],
              )
            end
          end
        end
      end
    end
  end
end
