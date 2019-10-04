require 'spec_helper'

describe SoccerSeason::Domain::Pitches::Pitch do
  subject { match }

  describe '.build' do
    SoccerSeason::Domain::Pitches::Pitch.build(name: 'home')
  end
end