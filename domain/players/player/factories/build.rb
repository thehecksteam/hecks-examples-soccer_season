module SoccerSeason
  module Domain
    module Players
      class Player
        module Factories
          class Build
            def self.factory(args)
              Player.new(
                id: args[:id],
                name: args[:name],
                team: args[:team].is_a?(Hash) ? {:Teams=>:Team}.build(args[:team]) : args[:team],
              )
            end
          end
        end
      end
    end
  end
end
