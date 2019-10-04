Dir[File.dirname(__FILE__) + '/subscribers/*.rb'].each { |file| require_relative file }
module SoccerSeason
  module Domain
    module Teams
      class Team
        module Subscribers
        end
      end
    end
  end
end
