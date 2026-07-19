# frozen_string_literal: true
# rbs_inline: enabled

require_relative 'spreen_tracks/version'
require_relative 'spreen_tracks/application'
require_relative 'spreen_tracks/cli'

# Spreens a music library — the falcon's stoop, then the preen: walks the
# current directory for media files with a given extension and rewrites their
# filenames so the space after the track number becomes a configurable
# delimiter and `N-` disc prefixes become `DiscN/` subdirectories.
module SpreenTracks
end
