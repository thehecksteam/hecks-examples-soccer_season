require 'spec_helper'

describe SoccerSeason::Domain::Teams::Team do
  subject { match }

  describe '.default' do
    SoccerSeason::Domain::Teams::Team.default(id: 1, name: 'redteam')
  end
end