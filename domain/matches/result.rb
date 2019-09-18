module SoccerSeason
  module Domain
    module Matches
      class Result
        
        include Support::DomainObject

        attr_reader :loser, :winner, :tied

        def initialize(loser:, winner:)
          @loser = loser
          @winner = winner
          @tied = nil
        end
        
        def tied?
          @tied
        end

        private

        attr_writer :loser, :winner, :tied
      end
    end
  end
end
