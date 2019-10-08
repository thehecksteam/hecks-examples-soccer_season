Gem::Specification.new do |s|
  s.name        = 'soccer_season'
  s.version     = '0.1.0'
  s.licenses    = ['MIT']
  s.summary     = 'Soccer Season Scheduler'
  s.description = 'Soccer Season is a more complex domain generaged by HecksDomain'
  s.authors     = ["SoccerSeason Developer"]
  s.email       = 'dev@soccer_season.com'
  s.files       = Dir['lib/**/*.rb', 'domain/**/*.rb', 'events/**/*.rb', 'Domainfile']
  s.homepage    = 'http://www.example.com'
  s.metadata    = { 'hecks_domain' => 'true' }
end