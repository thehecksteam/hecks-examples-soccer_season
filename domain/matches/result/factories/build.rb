module SoccerSeason
  module Domain
    module Matches
      class Result
        module Factories
          class Build
            def self.factory(args)
              Result.new(
                loser: args[:loser].is_a?(Hash) ? {:Teams=>:Team}.build(args[:loser]) : args[:loser],
                winner: args[:winner].is_a?(Hash) ? {:Teams=>:Team}.build(args[:winner]) : args[:winner],
                tied: args[:tied],
              )
            end
          end
        end
      end
    end
  end
end
