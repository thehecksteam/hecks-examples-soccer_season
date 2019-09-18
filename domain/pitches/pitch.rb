module SoccerSeason
  module Domain
    module Pitches
      class Pitch
        include Support::Root
        include Support::DomainObject

        attr_reader :id, :name, :id

        def initialize(id: nil, name:)
          @id = id
          @name = name
        end

        private

        attr_writer :id, :name
      end
    end
  end
end
