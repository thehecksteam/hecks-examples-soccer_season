require_relative 'support'
Dir[File.dirname(__FILE__) + "/../events/*.rb"].each { |file| require_relative file }
require_relative '../domain/matches/root'
require_relative '../domain/teams/root'
require_relative '../domain/players/root'
require_relative '../domain/pitches/root'

module SoccerSeason
  class InvariantViolationError < StandardError; end
end