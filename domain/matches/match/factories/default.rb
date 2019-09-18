module SoccerSeason
  module Domain
    module Matches
      class Match
        module Factories
          class Default
            def self.factory(args)
              args[:goals] ||= []
              Match.new(
                id: args[:id],
                fixture: Fixture.new(args[:fixture]),
                teams: args[:teams].map do |team|
                  Teams::Team::Repository.fetch(
                    team.is_a?(Hash) ? team[:id] : team.id
                  )
                end,
                pitch: Pitches::Pitch::Repository.fetch(
                  args[:pitch].is_a?(Hash) ? args[:pitch][:id] : args[:pitch].id
                ),
                goals: args[:goals].map { |goal_args| Goal.new(goal_args) }
              )
            end
          end
        end
      end
    end
  end
end
