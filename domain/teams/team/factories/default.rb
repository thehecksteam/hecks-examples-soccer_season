module SoccerSeason
  module Domain
    module Teams
      class Team
        module Factories
          class Default
            def self.factory(args)
              return args unless args.is_a?(Hash)
              Team.new(args)
            end
          end
        end
      end
    end
  end
end