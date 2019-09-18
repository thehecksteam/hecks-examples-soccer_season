module SoccerSeason
  module Domain
    module Matches
      class Goal
        module Factories
          class Default
            def self.factory(args)
              binding.pry
              Goal.new(args)
            end
          end
        end
      end
    end
  end
end
