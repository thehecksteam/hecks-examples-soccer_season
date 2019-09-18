RSpec.shared_examples "match" do
  let(:match) do
    SoccerSeason::Domain::Matches::Match.new(
      fixture: fixture,
      teams: [redteam, blueteam],
      pitch: pitch,
      result: nil
    ).tap(&:save)
  end

  let(:fixture) do
    SoccerSeason::Domain::Matches::Fixture.new(
      season: 2012,
      date: Date.today,
      time: Time.now
    )
  end

  let(:redteam) do
    SoccerSeason::Domain::Teams::Team.new(
      name: 'redteam'
    ).tap(&:save)
  end

  let(:blueteam) do
    SoccerSeason::Domain::Teams::Team.new(
      name: 'blueteam'
    ).tap(&:save)
  end

  let(:pitch) do
    SoccerSeason::Domain::Pitches::Pitch.new(
      name: 'downtown'
    ).tap(&:save)
  end

  let(:player_chris) do
    SoccerSeason::Domain::Players::Player.new(name: 'chris', team: redteam).tap(&:save)
  end

  let(:player_foster) do
    SoccerSeason::Domain::Players::Player.new(name: 'foster', team: redteam).tap(&:save)
  end

  let(:player_clayton) do
    SoccerSeason::Domain::Players::Player.new(name: 'clayton', team: blueteam).tap(&:save)
  end
end 