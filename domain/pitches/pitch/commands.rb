Dir[File.dirname(__FILE__) + '/commands/*.rb'].each {|file| require_relative file }
module SoccerSeason
  module Domain
    module Pitches
      class Pitch
        module Commands
        end
      end
    end
  end
end