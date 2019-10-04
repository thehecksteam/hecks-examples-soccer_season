Dir[File.dirname(__FILE__) + '/events/*.rb'].each { |file| require_relative file }
module SoccerSeason
  module Domain
    module Players
      class Player
        module Events
        end
      end
    end
  end
end