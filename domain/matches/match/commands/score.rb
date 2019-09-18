module SoccerSeason
  module Domain
    module Matches
      class Match
        module Commands
          class Score
            attr_reader :args, :root

            def initialize(match)
              @root = @match = match
              @teams = match.teams
              @goals = match.goals
            end

            def call
              self.tap do |command|
                @match.instance_eval do
                  @result = command.send(:set_result)
                end
              end

              self
            end

            private

            def get_count(team)
              @goals.count { |goal| goal.player.team == team }
            end

            def set_result
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
