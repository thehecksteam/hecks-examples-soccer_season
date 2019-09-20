module SoccerSeason
  module Domain
    module Teams
      class Team
        module Factories
          class Build
            def self.factory(args)
              Team.new(
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
