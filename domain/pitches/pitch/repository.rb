
module SoccerSeason
  module Domain
    module Pitches
      class Pitch
        class Repository
          include Singleton
          def self.save(object)
            instance.save(object)
          end

          def self.fetch(pitch)
            instance.fetch(pitch)
          end

          def initialize
            @objects = {}
          end

          def self.create(pitch)
            instance.create(pitch)
          end

          def self.all
            instance.all
          end

          def all
            @objects.values
          end

          def create(pitch)
            klass = self.class.const_get(
              self.class.to_s.gsub('::Repository', '')
            )
            domain_object = klass.build(pitch)
            domain_object.tap(&:save)
          end

          def fetch(fetchable)
            return @objects[fetchable.id] if fetchable.respond_to?(:id)

            @objects[fetchable]
          end

          def save(pitch)
            domain_object = pitch
            @objects[pitch.hash] = domain_object

            pitch.instance_eval do
              @id = pitch.hash
            end

            pitch
          end
        end
      end
    end
  end
end