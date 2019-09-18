module SoccerSeason
  module Domain
    module Matches
      class Match
        include Support::Head
        include Support::DomainObject

        attr_reader :id, :fixture, :result, :pitch, :id

        def initialize(id: nil, fixture:, goals: [], result: nil, teams:, pitch:)
          @id = id
          @fixture = fixture
          @goals = goals
          @result = result
          @teams = teams
          @pitch = pitch
        end

        def goals
          @goals.clone.freeze
        end

        def teams
          @teams.clone.freeze
        end

        private

        attr_writer :id, :fixture, :goals, :result, :teams, :pitch
      end
    end
  end
end
