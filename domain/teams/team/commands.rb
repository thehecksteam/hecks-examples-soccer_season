Dir[File.dirname(__FILE__) + '/commands/*.rb'].each {|file| require_relative file }
module SoccerSeason
  module Domain
    module Teams
      class Team
        module Commands
        end
      end
    end
  end
end