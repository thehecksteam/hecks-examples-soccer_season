module SoccerSeason
  module Domain
    module Players
      class Player
        module Factories
          class Default
            def self.factory(args)
              Player.new(
                id: args[:id],
                team: Teams::Team::Repository.fetch(
                  Teams::Team.default(args[:team])
                ),
                name: args[:name]
              )
            end
          end
        end
      end
    end
  end
end