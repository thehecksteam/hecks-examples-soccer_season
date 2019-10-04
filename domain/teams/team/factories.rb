Dir[File.dirname(__FILE__) + '/factories/*.rb'].each {|file| require_relative file }
module SoccerSeason
  module Domain
    module Teams
      class Team
        module Factories
        end
      end
    end
  end
  end