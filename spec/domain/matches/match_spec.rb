require 'spec_helper'

describe SoccerSeason::Domain::Matches::Match do
  include_examples 'match'
  include_examples 'subscriber'
  subject { match }
  let(:red_team) do 
    SoccerSeason::Domain::Teams::Team::Repository.save(
      SoccerSeason::Domain::Teams::Team.build(name: 'red_team')
    )
  end
  let(:blue_team) do
    SoccerSeason::Domain::Teams::Team::Repository.save(
      SoccerSeason::Domain::Teams::Team.build(name: 'blue_team')
    )
  end

  describe '.build' do
    it do
      match = SoccerSeason::Domain::Matches::Match.build(
        id: 2,
        fixture: {
          season: 'summer',
          date: Date.today,
          time: Time.now
        },
        teams: [red_team, blue_team],
        pitch: { name: 'backyard' }
      )
      expect(match.id).to eq 2
    end
  end

  describe '#score' do
    context "Subscriber" do
      let(:subscriber) do
        Subscriber.new(
          SoccerSeason::Domain::Matches::Match::Commands::Score
        )
      end

      before do
        Support::Events::DomainEventPublisher.subscribe(subscriber)
      end

      it do
        expect(subscriber).to receive(:notify)
        subject.score!
      end
    end
  end
end