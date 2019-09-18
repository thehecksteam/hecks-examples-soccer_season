module SoccerSeason
  module Domain
    module Matches
      class Match
        module Commands
          class SetTeams
            attr_reader :args, :root, :teams

            def initialize(match, teams)
              @root = @match = match
              @teams = teams
            end

            def call
              self.tap do |command|
                @match.instance_eval do
                  @teams = command.teams
                end
              end
              self
            end

            private

            def get_count(team)
              @goals.count { |goal| goal.player.team == team }
            end

            def result
              counts = @teams.map { |team| get_count(team) }

              return TiedResult.new if counts.first == counts.last
              return Result.new(winner: @teams.first, loser: @teams.last) if counts.first > counts.last

              Result.new(winner: @teams.last, loser: @teams.first)
            end
          end
        end
      end
    end
  end
end
