# frozen_string_literal: true

require_relative 'lib/spreen_tracks/version'

Gem::Specification.new do |spec|
  spec.name    = 'spreen-tracks'
  spec.version = SpreenTracks::VERSION
  spec.authors = ['hayat01sh1da']

  spec.summary     = 'Spreen your tracks: normalise iTunes-imported filenames with a configurable delimiter.'
  spec.description = "Spreen — the falcon's stoop, then the preen. Walks the current directory for media files with " \
                     'a given extension and rewrites their filenames so the space after the track number becomes a ' \
                     'configurable delimiter and `N-` disc prefixes become `DiscN/` subdirectories, dry run by ' \
                     'default, via the track-delimiter CLI.'
  spec.homepage = 'https://github.com/hayat01sh1da/spreen-tracks'
  spec.license  = 'MIT'
  spec.required_ruby_version = '>= 3.4'

  spec.metadata['homepage_uri']          = spec.homepage
  spec.metadata['source_code_uri']       = spec.homepage
  spec.metadata['changelog_uri']         = "#{spec.homepage}/blob/master/CHANGELOG.md"
  spec.metadata['bug_tracker_uri']       = "#{spec.homepage}/issues"
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files         = Dir['exe/*', 'lib/**/*.rb', 'sig/**/*.rbs', 'README.md', 'LICENSE.txt']
  spec.bindir        = 'exe'
  spec.executables   = ['track-delimiter']
  spec.require_paths = ['lib']
end
