module SoccerSeason
  module Domain
    module Matches
      class Fixture
        
        include Support::DomainObject

        attr_reader :season, :date, :time

        def initialize(season:, date:, time:)
          @season = season
          @date = date
          @time = time
        end

        private

        attr_writer :season, :date, :time
      end
    end
  end
end
