module SoccerSeason
  module Domain
    module Matches
      class Goal
        module Factories
          class Build
            def self.factory(args)
              Goal.new(
                time: args[:time],
                player: args[:player].is_a?(Hash) ? {:Players=>:Player}.build(args[:player]) : args[:player],
              )
            end
          end
        end
      end
    end
  end
end
