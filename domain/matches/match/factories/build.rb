module SoccerSeason
  module Domain
    module Matches
      class Match
        module Factories
          class Build
            def self.factory(args)
              Match.new(
                id: args[:id],
                fixture: args[:fixture].is_a?(Hash) ? Fixture.build(args[:fixture]) : args[:fixture],
                goals: (args[:goals] || []).map do |object|
                  object.is_a?(Hash) ? Goal.build(object) : object
                end,
                result: args[:result].is_a?(Hash) ? Result.build(args[:result]) : args[:result],
                teams: (args[:teams] || []).map do |object|
                  object.is_a?(Hash) ? {:Teams=>:Team}.build(object) : object
                end,
                pitch: args[:pitch].is_a?(Hash) ? Pitch.build(args[:pitch]) : args[:pitch],
              )
            end
          end
        end
      end
    end
  end
end
