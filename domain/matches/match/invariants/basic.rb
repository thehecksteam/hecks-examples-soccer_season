module SoccerSeason
  module Domain
    module Matches
      class Match
        module Invariants
          module Basic
            def invariant_two_teams(_command)
              return if @teams.count == 2

              raise 'Must have exactly two teams'
            end

            def invariant_different_teams(_command)
              return unless @teams.map(&:name).uniq.count == 1

              raise InvariantViolationError, 'Teams must be different'
            end
          end
        end
      end
    end
  end
end
