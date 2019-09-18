require 'spec_helper'
require 'date'

describe 'Playground' do
  include_examples 'subscriber'

  let(:match) do
    SoccerSeason::Domain::Matches::Match.create(
      fixture: fixture,
      teams: [@redteam, @blueteam],
      pitch: @pitch
    )
  end

  let(:fixture) do
    {
      season: 2012,
      date: Date.today,
      time: Time.now
    }
  end

  before do
    @pitch = SoccerSeason::Domain::Pitches::Pitch
             .new(name: 'downtown').tap(&:save)

    # Red Team
    @redteam = SoccerSeason::Domain::Teams::Team
               .new(name: 'redteam').tap(&:save)

    @chris = SoccerSeason::Domain::Players::Player
             .new(name: 'chris', team: @redteam).tap(&:save)
    @foster = SoccerSeason::Domain::Players::Player
              .new(name: 'foster', team: @redteam).tap(&:save)

    # Blue Team
    @blueteam = SoccerSeason::Domain::Teams::Team
                .new(name: 'blueteam').tap(&:save)
    @greenteam = SoccerSeason::Domain::Teams::Team
                 .new(name: 'greenteam').tap(&:save)
    @clayton = SoccerSeason::Domain::Players::Player
               .new(name: 'clayton', team: @blueteam).tap(&:save)

    5.times { match.add_goal!(time: Time.now, player: @foster) }
    4.times { match.add_goal!(time: Time.now, player: @clayton) }
  end

  it 'Has a root' do
    expect(
      SoccerSeason::Domain::Pitches::Root.superclass
    ).to eq SoccerSeason::Domain::Pitches::Pitch
  end

  it 'Events' do
    # Events

    match.score!
    expect(match.result.winner).to eq @redteam

    # I'm tired of calling `#score!` every time I add a goal
    subscriber = ScoreOnAddGoal.new
    Support::Events.subscribe(subscriber)
    3.times do
      match.add_goal!(time: Time.now, player: @clayton)
    end
    expect(match.result.winner).to eq(@blueteam)
    Support::Events.cancel_subscription(subscriber)
  end

  it 'Winner!' do
    match.score!
    expect(match.result.winner).to eq @redteam

    3.times do
      match.add_goal!(time: Time.now, player: @clayton)
    end

    match.score!
    expect(match.result.winner).to eq @blueteam
  end

  it 'Tied!' do
    match.add_goal!(time: Time.now, player: @clayton)
    match.score!
    expect(match.result).to be_a(SoccerSeason::Domain::Matches::TiedResult)
  end

  it 'blows up if you try to use the accessor to update lists' do
    expect { match.teams << @greenteam }
      .to raise_error('can\'t modify frozen Array')
  end

  it 'Invariants' do
    expect { match.set_teams!([@redteam, @blueteam, @greenteam]) }
      .to raise_error('Must have exactly two teams')
    expect { match.set_teams!([@redteam, @redteam]) }
      .to raise_error('Teams must be different')
  end

  it 'Fetching' do
    match.save
    SoccerSeason::Domain::Matches::Match::Repository.fetch(match.id)
  end

  it 'works with a block' do
    command = nil

    match.add_goal!(time: Time.now, player: @clayton) do |result|
      command = result.command.class.to_s
    end

    expect(command).to include('AddGoal')
  end
end
