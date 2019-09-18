require 'spec_helper'

describe SoccerSeason::Domain::Players::Player do
  subject { match }

  describe '.default' do
    SoccerSeason::Domain::Players::Player.default(
      name: 'redteam', team: { name: 'foo' }
    )
  end
end
