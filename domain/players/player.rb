module SoccerSeason
  module Domain
    module Players
      class Player
        include Support::Root
        include Support::DomainObject

        attr_reader :id, :name, :team, :id

        def initialize(id: nil, name:, team:)
          @id = id
          @name = name
          @team = team
        end

        private

        attr_writer :id, :name, :team
      end
    end
  end
end
