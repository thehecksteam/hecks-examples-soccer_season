Dir[File.dirname(__FILE__) + '/subscribers/*.rb'].each { |file| require_relative file }
module SoccerSeason
  module Domain
    module Players
      class Player
        module Subscribers
        end
      end
    end
  end
end
