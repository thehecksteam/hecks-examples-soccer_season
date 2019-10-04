Dir[File.dirname(__FILE__) + '/queries/*.rb'].each { |file| require_relative file }
module SoccerSeason
  module Domain
    module Players
      class Player
        module Queries
        end
      end
    end
  end
end