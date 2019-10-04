require 'spec_helper'

describe SoccerSeason::Domain::Players::Player do
  subject { match }

  describe '.build' do
    SoccerSeason::Domain::Players::Player.build(
      name: 'redteam', team: { name: 'foo' }
    )
  end
end
