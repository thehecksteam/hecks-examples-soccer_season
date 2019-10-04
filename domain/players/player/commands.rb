Dir[File.dirname(__FILE__) + '/commands/*.rb'].each {|file| require_relative file }
module SoccerSeason
  module Domain
    module Players
      class Player
        module Commands
        end
      end
    end
  end
end