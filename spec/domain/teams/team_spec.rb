require 'spec_helper'

describe SoccerSeason::Domain::Teams::Team do
  subject { match }

  describe '.build' do
    SoccerSeason::Domain::Teams::Team.build(id: 1, name: 'redteam')
  end
end