module SoccerSeason
  module Domain
    module Matches
      class Match
        module Commands
          class AddGoal
            attr_reader :args, :root, :time, :player
            def initialize(match, args = {})
              @args = args
              @root = match
              @time = args[:time]
              @player = args[:player]
            end

            def call
              tap do |command|
                @root.instance_eval do
                  @goals << Goal.new(time: command.time, player: command.player)
                end
              end
            end
          end
        end
      end
    end
  end
end