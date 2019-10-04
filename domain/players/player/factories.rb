Dir[File.dirname(__FILE__) + '/factories/*.rb'].each {|file| require_relative file }
module SoccerSeason
  module Domain
    module Players
      class Player
        module Factories
        end
      end
    end
  end
  end