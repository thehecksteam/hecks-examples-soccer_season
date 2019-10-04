Dir[File.dirname(__FILE__) + '/factories/*.rb'].each {|file| require_relative file }
module SoccerSeason
  module Domain
    module Matches
      class Goal
        module Factories
        end
      end
    end
  end
  end