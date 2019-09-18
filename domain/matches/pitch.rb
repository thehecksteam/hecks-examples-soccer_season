module SoccerSeason
  module Domain
    module Matches
      class Pitch
        
        include Support::DomainObject

        attr_reader :name

        def initialize(name:)
          @name = name
        end

        private

        attr_writer :name
      end
    end
  end
end
