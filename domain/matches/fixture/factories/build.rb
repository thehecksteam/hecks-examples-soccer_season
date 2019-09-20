module SoccerSeason
  module Domain
    module Matches
      class Fixture
        module Factories
          class Build
            def self.factory(args)
              Fixture.new(
                season: args[:season],
                date: args[:date],
                time: args[:time],
              )
            end
          end
        end
      end
    end
  end
end
