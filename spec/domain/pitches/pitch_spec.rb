require 'spec_helper'

describe SoccerSeason::Domain::Pitches::Pitch do
  subject { match }

  describe '.default' do
    SoccerSeason::Domain::Pitches::Pitch.default(name: 'home')
  end
end