Dir[File.dirname(__FILE__) + '/factories/*.rb'].each {|file| require_relative file }
module SoccerSeason
  module Players
    class Player
      module Factories
      end
    end
  end
  
end
