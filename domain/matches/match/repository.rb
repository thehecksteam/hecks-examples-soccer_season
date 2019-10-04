
module SoccerSeason
  module Domain
    module Matches
      class Match
        class Repository
          include Singleton
          def self.save(object)
            instance.save(object)
          end

          def self.fetch(match)
            instance.fetch(match)
          end

          def initialize
            @objects = {}
          end

          def self.create(match)
            instance.create(match)
          end

          def self.all
            instance.all
          end

          def all
            @objects.values
          end

          def create(match)
            klass = self.class.const_get(
              self.class.to_s.gsub('::Repository', '')
            )
            domain_object = klass.build(match)
            domain_object.tap(&:save)
          end

          def fetch(fetchable)
            return @objects[fetchable.id] if fetchable.respond_to?(:id)

            @objects[fetchable]
          end

          def save(match)
            domain_object = match
            @objects[match.hash] = domain_object

            match.instance_eval do
              @id = match.hash
            end

            match
          end
        end
      end
    end
  end
end