
module SoccerSeason
  module Domain
    module Teams
      class Team
        class Repository
          include Singleton
          def self.save(object)
            instance.save(object)
          end

          def self.fetch(team)
            instance.fetch(team)
          end

          def initialize
            @objects = {}
          end

          def self.create(team)
            instance.create(team)
          end

          def self.all
            instance.all
          end

          def self.destroy(team)
            instance.destroy(team)
          end

          def all
            @objects.values
          end

          def destroy(team)
            @objects.delete(team.id)
          end

          def create(team)
            klass = self.class.const_get(
              self.class.to_s.gsub('::Repository', '')
            )
            domain_object = klass.build(team)
            domain_object.tap(&:save)
          end

          def fetch(fetchable)
            return @objects[fetchable.id] if fetchable.respond_to?(:id)

            @objects[fetchable]
          end

          def save(team)
            domain_object = team
            @objects[team.hash] = domain_object

            team.instance_eval do
              @id = team.hash
            end

            team
          end
        end
      end
    end
  end
end