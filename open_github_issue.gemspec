$:.push File.expand_path('../lib', __FILE__)

require 'open_github_issue/version'

Gem::Specification.new do |s|
  s.name        = 'open_github_issue'
  s.version     = OpenGithubIssue::VERSION
  s.authors     = ['Paweł J. Wal']
  s.email       = ['p@steamshard.net']
  s.homepage    = 'https://github.com/paweljw/open_github_issue'
  s.summary     = 'Allow users to open issues on GitHub from your UI securely.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.2.0'
  s.add_dependency 'octokit', '~> 4.0'

  s.add_development_dependency 'sqlite3'
end
