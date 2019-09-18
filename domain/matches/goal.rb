module SoccerSeason
  module Domain
    module Matches
      class Goal
        
        include Support::DomainObject

        attr_reader :time, :player

        def initialize(time:, player:)
          @time = time
          @player = player
        end

        private

        attr_writer :time, :player
      end
    end
  end
end
