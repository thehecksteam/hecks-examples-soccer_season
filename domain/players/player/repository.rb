
module SoccerSeason
  module Domain
    module Players
      class Player
        class Repository
          include Singleton
          def self.save(object)
            instance.save(object)
          end

          def self.fetch(player)
            instance.fetch(player)
          end

          def initialize
            @objects = {}
          end

          def self.create(player)
            instance.create(player)
          end

          def self.all
            @objects.values
          end

          def create(player)
            klass = self.class.const_get(
              self.class.to_s.gsub('::Repository', '')
            )
            domain_object = klass.default(player)
            domain_object.tap(&:save)
          end

          def fetch(fetchable)
            return @objects[fetchable.id] if fetchable.respond_to?(:id)

            @objects[fetchable]
          end

          def save(player)
            domain_object = player
            @objects[player.hash] = domain_object

            player.instance_eval do
              @id = player.hash
            end

            player
          end
        end
      end
    end
  end
end
